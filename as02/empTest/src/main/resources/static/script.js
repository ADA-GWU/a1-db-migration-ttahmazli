'use strict';

const form = document.querySelector('.employee-form')
const nameInput = document.querySelectorAll('.name');
const emailInput = document.querySelector('.email');
const btnSave = document.querySelector('.save');
const btnCheck = document.querySelector('.validate');
const nameSpan = document.querySelectorAll('.error-name')
const emailSpan = document.querySelector('.error-mail')

const nameInputs = [...nameInput];
const nameSpans = [...nameSpan];

btnSave.addEventListener('click', function() {

	let issuePresent = false;

	fixName(nameInputs);

	for (let i = 0; i < nameInputs.length; i++) {
		if (!nameInputs[i].value)
			nameSpans[i].classList.remove('hidden')
		else
			nameSpans[i].classList.add('hidden');
	}

	if (validateEmail(emailInput.value)) {
		emailSpan.classList.add('hidden');
	} else {
		emailSpan.classList.remove('hidden');
	}

	issuePresent = !validateEmail(emailInput.value);

	if (!issuePresent) form.submit();
});

function fixName(nameArr) {
	for (let i = 0; i < nameArr.length; i++) {
		nameArr[i].value = nameArr[i].value.replace(/[^a-zA-Z]+/g, '');
		nameArr[i].value = nameArr[i].value.charAt(0).toUpperCase()
			+ nameArr[i].value.slice(1).toLowerCase();
	}
}

function validateEmail(email) {
	const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(email);
}