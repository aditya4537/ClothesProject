package com.example.clothes.dto;

import java.util.List;

import org.springframework.data.domain.Page;

import com.example.clothes.model.Clothes;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class APIResponse {

	int recordCount;
	Page<Clothes> response;
}
