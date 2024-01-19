package com.example.clothes.service;

import com.example.clothes.model.Clothes;

import java.util.List;

import org.springframework.data.domain.Page;

public interface ClothesService {
    public List<Clothes> getAllClothes();

    public Clothes addCloth(Clothes cloth);

    public Clothes editCloth(Clothes cloth);

    public void deleteClothById(Long id);
    
    public Page<Clothes> findClothesWithPagination(int offset, int pageSize);
    
    public List<Clothes> findAndSortClothes(String field);
    
    public Page<Clothes> findClothesWithPageAndSorting(int offset, int pageSize, String field);
}
