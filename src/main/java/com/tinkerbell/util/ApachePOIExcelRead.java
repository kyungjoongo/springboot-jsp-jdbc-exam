package com.tinkerbell.util;


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


public class ApachePOIExcelRead {

    private static final String FILE_NAME = "temp002.xls";


    /**
     * 엑셀파일로 부터 row를 읽어 List<HashMap> 형태를 반환
     *
     * @param file
     */
    public static List<HashMap> readExcelFile(MultipartFile file) {

        List resultArrayList = new ArrayList();
        try {

            //MultipartFile을 읽은후에  HSSFWorkbook 인스턴스로 변환.
            HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());


            Sheet datatypeSheet = workbook.getSheetAt(0);
            Iterator<Row> iterator = datatypeSheet.iterator();

            int row = 0;

            while (iterator.hasNext()) {

                Row currentRow = iterator.next();

                System.out.println("currentRow-->" + currentRow.getRowNum());
                Iterator<Cell> cellIterator = currentRow.iterator();

                int cellNo = 1;
                HashMap oneRowMap = new HashMap();
                while (cellIterator.hasNext()) {

                    System.out.println("cellno-->" + cellNo);

                    Cell currentCell = cellIterator.next();


                    System.out.print("cellNo:" + cellNo + "-->" + currentCell.getStringCellValue() + "\n");

                    if (cellNo == 1) {
                        oneRowMap.put("query", currentCell.getStringCellValue());
                    } else if (cellNo == 2) {
                        oneRowMap.put("query_answer", currentCell.getStringCellValue());
                    }

                    String currentCellValue = currentCell.getStringCellValue();

                    cellNo++;

                }
                System.out.println();
                row++;

                resultArrayList.add(oneRowMap);
            }

            System.out.println("arrList-->" + resultArrayList.toString());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return resultArrayList;
    }


}