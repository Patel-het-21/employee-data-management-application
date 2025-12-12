package com.employeedatamanagement.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.employeedatamanagement.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

	Optional<Employee> findByEmail(String email);

	Optional<Employee> findByMobile(String mobile);

	@Query("SELECT e FROM Employee e WHERE LOWER(e.firstName) LIKE LOWER(CONCAT('%', :name, '%')) OR LOWER(e.lastName) LIKE LOWER(CONCAT('%', :name, '%')) OR LOWER(CONCAT(e.firstName, ' ', e.lastName)) LIKE LOWER(CONCAT('%', :name, '%')) OR LOWER(CONCAT(e.lastName, ' ', e.firstName)) LIKE LOWER(CONCAT('%', :name, '%'))")
	List<Employee> findByNameContainingIgnoreCase(@Param("name") String name);

	boolean existsByEmail(String email);

	boolean existsByMobile(String mobile);

	// existence excluding id for update checks
	@Query("SELECT CASE WHEN COUNT(e) > 0 THEN true ELSE false END FROM Employee e WHERE e.email = :email AND e.id <> :id")
	boolean existsByEmailAndIdNot(String email, Long id);

	@Query("SELECT CASE WHEN COUNT(e) > 0 THEN true ELSE false END FROM Employee e WHERE e.mobile = :mobile AND e.id <> :id")
	boolean existsByMobileAndIdNot(String mobile, Long id);
}
