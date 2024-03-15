package com.ty.dao.implemntation;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ty.dao.BranchDao;
import com.ty.dto.Branch;
@Component
public class BranchDaoImplemtation implements BranchDao {
	 @Autowired
		private EntityManager entityManager;

	@Override
	public Branch createBranch(Branch branch) {
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(branch);
		entityTransaction.commit();
		return branch;
	}

	@Override
	public Branch findBranch(int id) {
		
		return entityManager.find(Branch.class, id);

	}

	@Override
	public Branch upadteBranch(Branch branch) {
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(branch);
		entityTransaction.commit();
		return branch;
	}

	@Override
	public boolean deleteBranch(Branch branch) {
		
		if (branch != null) {
			EntityTransaction entityTransaction=entityManager.getTransaction();
			entityTransaction.begin();
			entityManager.remove(branch);
			entityTransaction.commit();
			return true;
		}
		return false;
	}

}
