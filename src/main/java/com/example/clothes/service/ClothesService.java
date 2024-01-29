package com.example.clothes.service;

import com.example.clothes.model.Clothes;

import net.sf.jasperreports.engine.JRException;

import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;

public interface ClothesService {
    public List<Clothes> getAllClothes();

    public Clothes addCloth(Clothes cloth);

    public Clothes editCloth(Clothes cloth);

    public void deleteClothById(Long id);
    
    public Page<Clothes> findClothesWithPagination(int offset, int pageSize);
    
    public List<Clothes> findAndSortClothes(String field);
    
    public Page<Clothes> findClothesWithPageAndSorting(int offset, int pageSize, String field);
    
    public ResponseEntity<ByteArrayResource> exportReport(String reportFormat) throws FileNotFoundException, JRException;

	public List<Clothes> getSearchedClothes(String searchQuery);
}
