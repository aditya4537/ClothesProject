package com.example.clothes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.clothes.model.Clothes;
import com.example.clothes.repository.ClothesRepo;

@Service
public class ClothesServiceImpl implements ClothesService{

    @Autowired
    private ClothesRepo clothesRepo;
    
//  @PostConstruct
//  public void initDB() {
//      List<Clothes> clothes = IntStream.rangeClosed(1, 200)
//              .mapToObj(i -> new Clothes(i, "cloth" + i, "clothSize" + i, "color" + i, "category"+i, new Random().nextInt(50000)))
//              .collect(Collectors.toList());
//      clothesRepo.saveAll(clothes);
//  }
    
    @Override
    public List<Clothes> getAllClothes() {
        return clothesRepo.findAll();
    }
    
    public Clothes getClothById(Long id) {
    	return clothesRepo.findById(id).orElse(null);
    }
    
    
    @Override
    public Clothes addCloth(Clothes cloth) {
        return clothesRepo.save(cloth);
    }

    @Override
    public Clothes editCloth(Clothes cloth) {
        return clothesRepo.save(cloth);
    }

    @Override
    public void deleteClothById(Long id) {
        clothesRepo.deleteById(id);
    }
    
    @Override
    public Page<Clothes> findClothesWithPageAndSorting(int offset, int pageSize, String field){
    	return clothesRepo.findAll(PageRequest.of(offset, pageSize));
    }


	@Override
	public Page<Clothes> findClothesWithPagination(int offset, int pageSize) {
		return clothesRepo.findAll(PageRequest.of(offset, pageSize));
	}


	@Override
	public List<Clothes> findAndSortClothes(String field) {
		return clothesRepo.findAll(Sort.by(Sort.Direction.ASC, field));
	}
}
