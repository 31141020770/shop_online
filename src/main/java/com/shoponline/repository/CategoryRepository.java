package com.shoponline.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.shoponline.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity,Long>{
	CategoryEntity findOneByCode(String code);
}
