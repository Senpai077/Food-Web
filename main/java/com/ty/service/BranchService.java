package com.ty.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ty.dto.Branch;
import com.ty.dto.User;
@Component
public interface BranchService {

	boolean createBranchService(Branch branch);
	boolean updateBranchService(Branch branch);
	boolean deleteBranchService(Branch branch);
	Branch getBranchServiceById(int id);
	User getBranchMangerServiceByBranchId(int id);
	Branch getBranchByBranchName(String branchName);
	List<Branch> getAllBranches();
}
