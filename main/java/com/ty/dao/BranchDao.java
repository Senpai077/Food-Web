package com.ty.dao;

import org.springframework.stereotype.Component;

import com.ty.dto.Branch;
@Component
public interface BranchDao {
 
	Branch createBranch(Branch branch);
	Branch findBranch(int id);
	Branch upadteBranch(Branch branch);
	boolean deleteBranch(Branch branch);
}
