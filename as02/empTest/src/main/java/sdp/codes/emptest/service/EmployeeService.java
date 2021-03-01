package sdp.codes.emptest.service;

import java.util.List;

import sdp.codes.emptest.model.Employee;

public interface EmployeeService {
	List<Employee> getAllEmployees();

	void saveEmployee(Employee employee);
	
	Employee getEmployeById(long id);
	
	void deleteEmployeeById(long id);
}
