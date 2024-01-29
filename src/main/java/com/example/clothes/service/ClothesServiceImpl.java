package com.example.clothes.service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import com.example.clothes.model.Clothes;
import com.example.clothes.repository.ClothesRepo;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

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
    	System.err.println(cloth.getClothId());
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
    	return clothesRepo.findAll(PageRequest.of(offset, pageSize).withSort(Sort.by(Sort.Direction.ASC,"clothId")));
    }


	@Override
	public Page<Clothes> findClothesWithPagination(int offset, int pageSize) {
		return clothesRepo.findAll(PageRequest.of(offset, pageSize).withSort(Sort.by("clothId")));
	}


	@Override
	public List<Clothes> findAndSortClothes(String field) {
		return clothesRepo.findAll(Sort.by(Sort.Direction.ASC, field));
	}
	
//	@Override
	public String exportReport1(String reportFormat) throws FileNotFoundException, JRException {
		String path = "C:\\Users\\adityakumarpatel\\Downloads";
		List<Clothes> clothes = clothesRepo.findAll();
		System.out.println(clothes);
		// load and compile file
		File file = ResourceUtils.getFile("classpath:clothes.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
		
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(clothes);
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("CreatedBy", "Aditya Patel");
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
		
		if(reportFormat.equalsIgnoreCase("pdf")){
			JasperExportManager.exportReportToPdfFile(jasperPrint, path + "\\clothes.pdf");
			System.err.println("pdf is generated");
			return path + "\\student.pdf";
		}
		else if(reportFormat.equalsIgnoreCase("html")){
			JasperExportManager.exportReportToHtmlFile(jasperPrint, path + "\\clothes.html");
			System.err.println("html is generated");
			return path + "\\student.html";
		}
		else if(reportFormat.equals("excel")) {
			JRXlsxExporter exporter = new JRXlsxExporter();
			exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
			exporter.setExporterOutput( new SimpleOutputStreamExporterOutput(path + "\\student.xls"));
			exporter.exportReport();
			return path + "\\student.xls";
		}
		else {			
			return "error";
		}
		
	}

	@Override
	public List<Clothes> getSearchedClothes(String searchQuery) {
		return clothesRepo.getBySearchParam(searchQuery);
	}
	
	public ResponseEntity<ByteArrayResource> exportReport(String reportFormat) throws FileNotFoundException, JRException {
        List<Clothes> clothes = clothesRepo.findAll();

        // load and compile file
        File file = ResourceUtils.getFile("classpath:clothes.jrxml");
        JasperPrint jasperPrint = generateJasperPrint(file, clothes);

        byte[] reportBytes;

        if (reportFormat.equalsIgnoreCase("pdf")) {
            reportBytes = JasperExportManager.exportReportToPdf(jasperPrint);
            return getResponseEntity(reportBytes, "clothes.pdf", MediaType.APPLICATION_PDF);
//        } else if (reportFormat.equalsIgnoreCase("html")) {
//            reportBytes = JasperExportManager.exportReportToHtml(jasperPrint);
//            return getResponseEntity(reportBytes, "clothes.html");
        } else if (reportFormat.equals("xls")) {
            reportBytes = exportToExcel(jasperPrint);
            return getResponseEntity(reportBytes, "clothes.xls", MediaType.APPLICATION_OCTET_STREAM);
        } else {
            return ResponseEntity.badRequest().body(null); // or handle the error appropriately
        }
    }

    private JasperPrint generateJasperPrint(File file, List<Clothes> clothes) throws JRException {
        JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
        JRDataSource dataSource = new JRBeanCollectionDataSource(clothes);
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("CreatedBy", "Aditya Patel");
        return JasperFillManager.fillReport(jasperReport, parameters, dataSource);
    }

    private byte[] exportToExcel(JasperPrint jasperPrint) throws JRException {
        JRXlsxExporter exporter = new JRXlsxExporter();
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(outputStream));
        exporter.exportReport();
        return outputStream.toByteArray();
    }

    private ResponseEntity<ByteArrayResource> getResponseEntity(byte[] reportBytes, String fileName, MediaType contentType) {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName);
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE);  // Use APPLICATION_OCTET_STREAM
        headers.add(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name());
        ByteArrayResource resource = new ByteArrayResource(reportBytes);
        return ResponseEntity.ok().headers(headers).body(resource);
    }

}
