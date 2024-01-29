package com.example.clothes.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.clothes.model.Clothes;

@Repository
public interface ClothesRepo extends JpaRepository<Clothes, Long> {

	@Query("SELECT c FROM Clothes c ORDER BY c.clothId")
	public List<Clothes> findAll();

	@Query("SELECT c FROM Clothes c "
			+ "WHERE LOWER(CONCAT(c.clothName, c.category, c.color, c.clothSize, c.price)) "
			+ "LIKE LOWER(CONCAT('%', :s, '%'))")
	public List<Clothes> getBySearchParam(@Param("s") String searchQuery);
}
