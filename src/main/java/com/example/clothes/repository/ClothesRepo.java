package com.example.clothes.repository;

import com.example.clothes.model.Clothes;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ClothesRepo extends JpaRepository<Clothes, Long> {
	
	@Query("SELECT c FROM Clothes c Order By c.clothId")
	List<Clothes> findAll();
}
