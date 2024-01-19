package com.example.clothes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.clothes.dto.APIResponse;
import com.example.clothes.model.Clothes;
import com.example.clothes.service.ClothesService;

@RestController
public class MainController {

	@Autowired
	private ClothesService clothesService;

	@GetMapping("/")
	public ModelAndView Home() {
		ModelAndView mv = new ModelAndView("add");
		mv.addObject("clothes", clothesService.getAllClothes());
		return mv;
	}

	@PostMapping("/add")
	public void addCloth(@RequestBody Clothes cloth) {
		clothesService.addCloth(cloth);
	}

	@GetMapping("/get")
	public List<Clothes> getCloth() {
		return clothesService.getAllClothes();
	}
	
	@GetMapping("/get/{offset}/{pageSize}")
	public APIResponse getClothWithPagination(@PathVariable int offset, @PathVariable int pageSize) {
		Page<Clothes> clothesPagination = clothesService.findClothesWithPagination(offset, pageSize);
		return new APIResponse(clothesPagination.getSize(), clothesPagination);
	}

	@GetMapping("/get/{offset}/{pageSize}/{field}")
	public APIResponse getClothWithPaginationAndSorting(@PathVariable int offset, @PathVariable int pageSize, @PathVariable String field) {
		Page<Clothes> clothesPaginationSorting = clothesService.findClothesWithPageAndSorting(offset, pageSize, field);
		return new APIResponse(clothesPaginationSorting.getSize(), clothesPaginationSorting);
	}
	
	@GetMapping("/get/{field}")
	public List<Clothes> sortClothes(@PathVariable String field) {
		List<Clothes> clothesSort = clothesService.findAndSortClothes(field);
		return clothesSort;
	}

	@GetMapping("/index")
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView("index");
		return mv;
	}

	@RequestMapping("/delete/{id}")
	public ModelAndView deleteById(@PathVariable String id) {
		Long iid = Long.parseLong(id);
		clothesService.deleteClothById(iid);
		return new ModelAndView("add");
	}
}
