package com.tinkerbell.controller;

import com.tinkerbell.util.ApachePOIExcelRead;
import org.junit.Before;
import org.junit.Test;

/**
 * Created by kyungjoon on 2017-05-09.
 */
public class TinkerbellControllerTest {
    @Test
    public void singleFileUpload1() throws Exception {
    }

    @Before
    public void setUp() throws Exception {
    }

    @Test
    public void grid() throws Exception {

        System.out.println("sdlkfsdkflsdkflskdflk");
    }

    @Test
    public void getGridData2() throws Exception {
    }

    @Test
    public void singleFileUpload() throws Exception {

        final String FILE_NAME = "temp002.xls";


        ApachePOIExcelRead.readExcelFile(FILE_NAME);



    }

    @Test
    public void uploadStatus() throws Exception {
    }

}