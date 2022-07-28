package kr.co.ejsoft.cims.common.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUploader {

	public static Workbook getWorkbook(String filePath) {
		FileInputStream in = null;
		try {
			in = new FileInputStream(filePath);
		} catch(FileNotFoundException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
		
		Workbook wb = null;
		
		if(filePath.toLowerCase().endsWith(".xls")) {
			try {
				wb = new HSSFWorkbook(in);
			} catch(IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		} else if(filePath.toLowerCase().endsWith(".xlsx")) {
			try {
				wb = new XSSFWorkbook(in);
			} catch(IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		
		return wb;
	}
	
	public static String getCellValue(Cell cell) {
		String value = "";
		
		if(cell != null) {
			switch(cell.getCellType()) {
				case Cell.CELL_TYPE_FORMULA :
					value = cell.getCellFormula();
					break;
				case Cell.CELL_TYPE_NUMERIC :
					value = (int) cell.getNumericCellValue() + "";
					break;
				case Cell.CELL_TYPE_STRING :
					value = cell.getStringCellValue();
					break;
				case Cell.CELL_TYPE_BOOLEAN :
					value = cell.getBooleanCellValue() + "";
					break;
				case Cell.CELL_TYPE_ERROR :
					value = cell.getErrorCellValue() + "";
					break;
				case Cell.CELL_TYPE_BLANK :
					value = "";
					break;
				default :
					value = cell.getStringCellValue();
					break;
			}
		}
		
		return value;
	}
	
}
