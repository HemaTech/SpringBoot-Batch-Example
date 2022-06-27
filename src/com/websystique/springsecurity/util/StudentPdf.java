package com.websystique.springsecurity.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.websystique.springmvc.dto.Student_ReportDTO;
import com.websystique.springmvc.service.UserProfileService;


@Component
public class StudentPdf {
	
	@Autowired
	private UserProfileService userService;

	
	 private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
	            Font.BOLD);
	    private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
	            Font.NORMAL, BaseColor.RED);
	    private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
	            Font.BOLD);
	    private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 14,
	            Font.UNDERLINE);
	    
	    private static Font underline = new Font(Font.FontFamily.HELVETICA, 16, Font.UNDERLINE);
	    
	
	  
    //This method is declared for Download  TransferCertificate Pdf
   public byte[] addContentForTc(Document document , Student_ReportDTO studentDetails) throws IOException {
			
	    	System.out.println("MyPDF===========");
	    	System.out.println(studentDetails.getName());
	    	
	    	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    	PdfWriter writer = null;
			try {
				writer = PdfWriter.getInstance(document, baos);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	        document.open();
	       
	        PdfContentByte canvas = writer.getDirectContent();
	        Rectangle rect = new Rectangle(36, 36, 559, 806);
	        rect.setBorder(Rectangle.BOX);
	        rect.setBorderColor(BaseColor.GRAY);
	        rect.setBorderWidth(2);
	        canvas.rectangle(rect);
	        
	        Paragraph paragraph=new Paragraph("Transfer Certificate",underline);
	        paragraph.setAlignment(Element.ALIGN_CENTER);
	        try {
				document.add(paragraph);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        try {
				document.add(addEmptyLine(new Paragraph(), 2));
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
	      // this line refer to name
	    			Phrase studentname = new Paragraph("  1) Name Of the Pupil                                                     :	");
	    			Chunk underline = new Chunk("                   "+studentDetails.getStudent_name()+"                 ",subFont);
	    			underline.setUnderline(0.1f, -2f); 
	    			studentname.add(underline);
	    			try {
						document.add(studentname);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			
	    		
	    			
	      // this line refer to father's name 
	    			Paragraph fathername = new Paragraph("  2) Father's/Guardian's Name                                         : ");
	    			Chunk underline1 = new Chunk("                  "+studentDetails.getName()+"                 ",subFont);
	    			underline1.setUnderline(0.1f, -2f); 
	    			fathername.add(underline1);
	    			try {
						document.add(fathername);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	       // this line refer to nationality 		
	    			Paragraph nationality = new Paragraph("  3) Nationality                                                                  :  ");
	    			Chunk underline2 = new Chunk("                     INDIAN                     ",subFont);
	    			underline2.setUnderline(0.1f, -2f); 
	    			nationality.add(underline2);
	    			try {
						document.add(nationality);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	       // this line refer to caste 		
	    			Paragraph caste = new Paragraph("  4) Whether The candidate belongs To");
	    			try {
						document.add(caste);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			Paragraph subparagraph=new Paragraph("    Schedule Caste or schedule tribe                                :  ");
	    			Chunk underline3 = new Chunk("                      INDIAN                     ",subFont);
	    			underline3.setUnderline(0.1f, -2f); 
	    			subparagraph.add(underline3);
	    			try {
						document.add(subparagraph);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	        // this line refer to DateOfAdmission 		
	    			Paragraph dateOfAdmission = new Paragraph("  5) Date Of Admission In the School With Class             :  ");
	    			Chunk underline4 = new Chunk("                         INDIAN                     ",subFont);
	    			underline4.setUnderline(0.1f, -2f); 
	    			dateOfAdmission.add(underline4);
	    			try {
						document.add(dateOfAdmission);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	 // this line refer to DOB	
	    			Paragraph DateOfBirth = new Paragraph("  6) Date Of Birth According To Admin Register              :  ");
	    			Chunk underline5 = new Chunk("                   INDIAN                   ",subFont);
	    			underline5.setUnderline(0.1f, -2f); 
	    			DateOfBirth.add(underline5);
	    			try {
						document.add(DateOfBirth);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	 // this line refer to Student Class 		
	    			Paragraph studentClass = new Paragraph("  7) Class in which the pupil last studied                         :  ");
	    			Chunk underline6 = new Chunk("                    INDIAN                    ",subFont);
	    			underline6.setUnderline(0.1f, -2f); 
	    			studentClass.add(underline6);
	    			try {
						document.add(studentClass);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	// this line refer to Subject 		
	    			Paragraph subjects = new Paragraph("  8) Subjects                                                                    :  ");
	    			Chunk underline7 = new Chunk("                        INDIAN                     ",subFont);
	    			underline7.setUnderline(0.1f, -2f); 
	    			subjects.add(underline7);
	    			try {
						document.add(subjects);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	// this line refer to Languages 		
	    			Paragraph languages = new Paragraph("  9) Languages                                                                 :  ");
	    			Chunk underline8 = new Chunk("                     "+studentDetails.getMedium_name()+"                      ",subFont);
	    			underline8.setUnderline(0.1f, -2f); 
	    			languages.add(underline8);
	    			try {
						document.add(languages);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	// this line refer to qualified for promotion to the higer class 		
	    			Paragraph higerClass = new Paragraph("  10) Whether qualified for promotion to") ;    
	    			try {
						document.add(higerClass);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}  
	    			Paragraph hclassSubPara=new Paragraph("      the higer class if so,to which class                             :  ");
	    			Chunk underline9 = new Chunk("                     INDIAN                       ",subFont);
	    			underline9.setUnderline(0.1f, -2f); 
	    			hclassSubPara.add(underline9);
	    			try {
						document.add(hclassSubPara);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	// this line refer to Any Fee consession availed of:if so,the nature of such concession 		
	    			Paragraph feeConsession = new Paragraph("  11) Any Fee consession availed of:if");
	    			try {
						document.add(feeConsession);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			Paragraph feeSubPara=new Paragraph("       so,the nature of such concession                              :  ");
	    			Chunk underline10 = new Chunk("                     INDIAN                    ",subFont);
	    			underline10.setUnderline(0.1f, -2f); 
	    			feeSubPara.add(underline10);
	    			try {
						document.add(feeSubPara);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	// this line refer to nationality 		
	    			Paragraph noOfWorkingDays = new Paragraph("  12) Total No.of Working Days                                       :  ");
	    			Chunk underline11 = new Chunk("                    INDIAN                      ",subFont);
	    			underline11.setUnderline(0.1f, -2f); 
	    			noOfWorkingDays.add(underline11);
	    			try {
						document.add(noOfWorkingDays);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	 // this line refer to Total No.of Working Days present 		
	    			Paragraph workingDaysPresent = new Paragraph("  13) Total No.of Working Days present                           :  ");
	    			Chunk underline12 = new Chunk("                       INDIAN                     ",subFont);
	    			underline12.setUnderline(0.1f, -2f); 
	    			workingDaysPresent.add(underline12);
	    			try {
						document.add(workingDaysPresent);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			
	    	 // this line refer to Games played or extra curricular activites in which the pupil usually took part 		
	    			Paragraph extraActivities = new Paragraph("  14) Games played or extra curricular");  
	    			Paragraph extraActivitiesSubPara = new Paragraph("      activites in which the pupil usually took part           :  ");
	    			try {
						document.add(extraActivities);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			Chunk underline13 = new Chunk("                       INDIAN                      ",subFont);
	    			underline13.setUnderline(0.1f, -2f); 
	    			extraActivitiesSubPara.add(underline13);
	    			try {
						document.add(extraActivitiesSubPara);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			
	    	// this line refer to Genarel Conduct  		
	    			Paragraph conduct = new Paragraph("  15) Genarel Conduct                                                   :  ");
	    			Chunk underline14 = new Chunk("                        INDIAN                   ");
	    			underline14.setUnderline(0.1f, -2f); 
	    			conduct.add(underline2);
	    			try {
						document.add(conduct);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    	 // this line refer to Date Of Aplication For Transfer certificate  	
	    			Paragraph applyTcDate = new Paragraph("  16) Date Of Aplication For Transfer certificate            :  ");
	    			Chunk underline15 = new Chunk("                           INDIAN                    ",subFont);
	    			underline15.setUnderline(0.1f, -2f);  
	    			applyTcDate.add(underline15);
	    			try {
						document.add(applyTcDate);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			//document.add(addEmptyLine(new Paragraph(), 1));
	    	 // this line refer to  Date Of Issue Of Transfer certificate 		
	    			Paragraph issueTcDate = new Paragraph("  17) Date Of Issue Of Transfer certificate                   :  ");
	    			Chunk underline16 = new Chunk("                          INDIAN                    ",subFont);
	    			underline16.setUnderline(0.1f, -2f);  
	    			issueTcDate.add(underline16);
	    			try {
						document.add(issueTcDate);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    		//	document.add(addEmptyLine(new Paragraph(), 1));
	    	 // this line refer to Reason For Leaving The School		
	    			Paragraph reasonForLeaving = new Paragraph("  18) Reason For Leaving The School                         :  ");
	    			Chunk underline17 = new Chunk("                          INDIAN                   ",subFont);
	    			underline17.setUnderline(0.1f, -2f); 
	    			reasonForLeaving.add(underline17);
	    			try {
						document.add(reasonForLeaving);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			
	    	 // this line refer to Any Other Remark  		
	    			Paragraph remarks = new Paragraph("  19) Any Other Remark                                               :  ");
	    			Chunk underline18 = new Chunk("                        INDIAN                  ",subFont);
	    			underline18.setUnderline(0.1f, -2f); 
	    			remarks.add(underline18);
	    			try {
						document.add(remarks);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			try {
						document.add(addEmptyLine(new Paragraph(), 1 ));
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			Paragraph signTeacher = new Paragraph("  Signature Of Class Teacher                                                                                       PRINCIPAL");
	    			try {
						document.add(signTeacher);
					} catch (DocumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			
	    		
	    			
	        document.close();
			byte[] pdfOfTcAsBytes = baos.toByteArray();
			baos.close();
			return pdfOfTcAsBytes;
	    	
	    	
	    	
	    }
	    private static Element addEmptyLine(Paragraph paragraph, int number) {
	        for (int i = 0; i < number; i++) {
	            paragraph.add(new Paragraph(" "));
	        }
			return paragraph;
	    }
		
	  //This method is declared for Download  BonaFied Certificate Pdf
		public byte[] addContentForBonafied(Document document,
				Student_ReportDTO std) throws DocumentException, IOException {
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    	PdfWriter writer = PdfWriter.getInstance(document, baos);
	        document.open();
	        
	        PdfContentByte canvas = writer.getDirectContent();
	        Rectangle rect = new Rectangle(36, 36, 559, 806);
	       
	        rect.setBorder(Rectangle.BOX);
	        rect.setBorderWidth(2);
	        rect.setBorderColor(BaseColor.GRAY);
	        canvas.rectangle(rect);
	        
	        Paragraph paragraph=new Paragraph("BONAFIED CERTIFICATE",underline);
	        paragraph.setAlignment(Element.ALIGN_CENTER);
	        document.add(paragraph);
	        document.add(addEmptyLine(new Paragraph(), 8));
	     
	        
	        Phrase certify=new Phrase("        This  is  to   certify   that  Mr / Miss");
	        Chunk certifyLine = new Chunk("                " +std.getName()+ "                                   ");
	        certifyLine.setUnderline(0.1f, -2f);
	        certify.add(certifyLine);
	        document.add(certify);
	        
	        
	        Phrase gender=new Phrase("is / was                a  bonafied  student   of   this   school   in  Std");
	        Chunk genderLine = new Chunk("                 ");
	        genderLine.setUnderline(0.1f, -2f);
	        gender.add(genderLine);
	        
	        document.add(gender);
	        Phrase year=new Phrase("(Year ");
	        Chunk yearLine = new Chunk("                      "+")");
	        yearLine.setUnderline(0.1f, -2f);
	        year.add(yearLine);
	        document.add(year);
	        document.add(addEmptyLine(new Paragraph(), 1));
	        Phrase dob=new Phrase("                   His  /  Her   birthdate   as   recorded   in   the   Genarel   Register   of   the    school           is ");
	        Chunk dobLine = new Chunk("                                                                                                                    ");
	        dobLine.setUnderline(0.1f, -2f); 
	        dob.add(dobLine);
	        document.add(dob);
	        Phrase rgDob=new Phrase("(31-1-2012)");
	        document.add(rgDob);
	        document.add(addEmptyLine(new Paragraph(), 1));
	        Paragraph character=new Paragraph("   To   the   best   of    my    knowledge   he/she   bears   a   good    moral   character. ");
	        document.add(character);
	        
	        document.add(addEmptyLine(new Paragraph(), 4));
	        Phrase date = new Paragraph("  Date :                                                                                            PRINCIPAL  ");
	        document.add(date);
	
	        document.close();
			byte[] pdfOfBonafiedAsBytes = baos.toByteArray();
			baos.close();
			
			return pdfOfBonafiedAsBytes;
		}
		
		//This method is declared for Download  StudyAndConduct Pdf
		public byte[] addStudyAndConduct(Document document, Student_ReportDTO std) throws DocumentException, IOException {
			
		   	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    	PdfWriter writer = PdfWriter.getInstance(document, baos);
	        document.open();
	        
	        PdfContentByte canvas = writer.getDirectContent();
	        Rectangle rect = new Rectangle(36, 36, 559, 806);
	       
	        rect.setBorder(Rectangle.BOX);
	        rect.setBorderWidth(2);
	        rect.setBorderColor(BaseColor.GRAY);
	        canvas.rectangle(rect);
	        
	        Paragraph studyAndConduct=new Paragraph("Study&Conduct Certificate",underline);
	        studyAndConduct.setAlignment(Element.ALIGN_CENTER);
	        document.add(studyAndConduct);
	        document.add(addEmptyLine(new Paragraph(), 3));			
			
			    Paragraph date = new Paragraph("Date:");
		        date.setAlignment(Element.ALIGN_RIGHT);
		    	Chunk line = new Chunk("           ");
		    	line.setUnderline(0.1f, -2f);
		    	date.add(line);
		        document.add(date);
		        document.add(addEmptyLine(new Paragraph(), 4));
		        
			    Paragraph names=new Paragraph("  This is to Certify that Mr / Miss  :   ");
			    names.setAlignment(names.ALIGN_CENTER);
			    Chunk name = new Chunk("     " +std.getName()+ "                   ");
			    name.setUnderline(0.1f, -2f);
			    names.add(name);
			    document.add(names);
			    
			    Phrase student=new Phrase("  Son / Daughter of  :  ");
		        Chunk stdname = new Chunk("        " +std.getFather_name()+"                 ");
		        stdname.setUnderline(0.1f, -2f);
		        student.add(stdname);
		        document.add(student);
		        
		        Phrase subpara=new Phrase("  is / was a   bonafide   student   of   this   institution   ");
		        document.add(subpara);
		        
		        Phrase institution=new Phrase("        from class");
		        Chunk tution = new Chunk("          " +std.getClass()+ "                    ");
		        tution.setUnderline(0.1f, -2f);
		        institution.add(tution);
		        document.add(institution);
		        
		        
		        Phrase years=new Phrase("during   the   years");
		        Chunk year = new Chunk("                                 ");
		        year.setUnderline(0.1f, -2f);
		        years.add(year);
		        document.add(years);
		       
		        Phrase condut=new Phrase("  During   His / Her                 study  His / Her  conduct  is ");
			    Chunk conducts = new Chunk("             GOOD                       ");
			    conducts.setUnderline(0.1f, -2f);
			    condut.add(conducts);
			    document.add(condut);
			     
			      
			    Paragraph dateofBirth=new Paragraph("  His/Her Date of Birth according to School Admission register is");
			    Chunk dob = new Chunk("                                          ");
			    dob.setUnderline(0.1f, -2f);
			    dateofBirth.add(dob);
			    document.add(dateofBirth);   
			    document.add(addEmptyLine(new Paragraph(), 4));
			      
			      Paragraph principal=new Paragraph("                                                                                                           PRINCIPAL");
			      document.add(principal);
			      document.add(addEmptyLine(new Paragraph(), 1));
			      Paragraph sign = new Paragraph("                                                                                  Signature : ");
			      
			      Chunk signature = new Chunk("                                                 ");
			      signature.setUnderline(0.1f, -2f);
			      sign.add(signature);
			      document.add(sign);
			        
			     document.close();
				 byte[] pdfOfConductAsBytes = baos.toByteArray();
				 baos.close();
				
					
	    return pdfOfConductAsBytes;
			
		}
		public byte[] addMarksAndMemo(Document document, Student_ReportDTO std) throws DocumentException, IOException {
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    	PdfWriter writer = PdfWriter.getInstance(document, baos);
	    	
	        document.open();
	        
	        PdfContentByte canvas = writer.getDirectContent();
	        Rectangle rect = new Rectangle(36, 36, 559, 806);
	       
	        rect.setBorder(Rectangle.BOX);
	        rect.setBorderWidth(2);
	        rect.setBorderColor(BaseColor.GRAY);
	        canvas.rectangle(rect);
	        
	        Paragraph paragraph=new Paragraph("Memorandum Of Marks for Passed Candidate",underline);
	        paragraph.setAlignment(Element.ALIGN_CENTER);
	        document.add(paragraph);
	        document.add(addEmptyLine(new Paragraph(), 2));
	        
	        Phrase rollNo = new Phrase(" 1) ROLL NUMBER          :                          ");
		    document.add(rollNo);
	        
		    Phrase dob = new Phrase("                          2)DATE OF BIRTH  : ");
		    document.add(dob);
	        
		    Paragraph name=new Paragraph(" 3) CANDIDATE'S NAME : " +std.getName()+ "");
		    document.add(name);
		      
		    Paragraph fathername=new Paragraph(" 4) FATHER'S NAME       : " +std.getFather_name()+ " ");
		    document.add(fathername);
		    Paragraph schoolName=new Paragraph(" 5) College NAME         :  ");
		    document.add(schoolName);
		    document.add(addEmptyLine(new Paragraph(), 1));
		        
		    Paragraph medium=new Paragraph("MEDIUM :   ENGLISH");
		    medium.setAlignment(Element.ALIGN_RIGHT);
		    document.add(medium);
		    document.add(addEmptyLine(new Paragraph(), 5));
		        
		     createPdf(document);
		        
		    document.add(addEmptyLine(new Paragraph(), 1));
		    Paragraph divison=new Paragraph("DIVISION : ",redFont);
		    divison.setAlignment(Element.ALIGN_RIGHT);
		    Chunk div = new Chunk("SECOND");
		    div.setUnderline(0.1f, -2f);
		    divison.add(div);
			document.add(divison);
			        
		        
	        document.close();
			byte[] pdfOfMarksAndMemo = baos.toByteArray();
			baos.close();
		
		return pdfOfMarksAndMemo;
		}
		
		private void createPdf(Document document) throws DocumentException {
			 
	   		    PdfPTable table = new PdfPTable(5);
	   		    table.setWidths(new float[]{ 2, 1, 1, 1.2f, 1.2f});
	   		    table.addCell(createCell("SUBJECT", 2, 1, Element.ALIGN_CENTER));
	   		    table.addCell(createCell("MAXIMUM MARKS", 2, 1, Element.ALIGN_CENTER));
	   		    table.addCell(createCell("QUALIFYING MARKS", 2, 1, Element.ALIGN_CENTER));
	   		    table.addCell(createCell("MARKS SECURED(IN FIGURES)", 2, 1, Element.ALIGN_CENTER));
	   		    table.addCell(createCell("MARKS SECURED(IN WORDS)", 2, 1, Element.ALIGN_CENTER));
	   		    String[][] data = {
	   		        {"FIRST LANGUAGE", "100", "35", "44", "Forty-Four"},
	   		        {"SECOND LANGUAGE", "100", "20", "52", "Fifty-Two"},
	   		        {"THIRD LANGUAGE", "100", "35", "47", "Forty-seven"},
	   		        {"MATHEMATICS", "100", "35", "87", "Eighty-seven"},
	   		        {"GENERAL SCIENCE", "100", "35", "45", "Forty-Five"},
	   		        {"SOCIAL STUDIES", "100", "35", "59", "Fifty-Nine"},
	   		        {" ", " ", " ", " ", " "},	
	   		        {"GRAND TOTAL","600"," ","334"," "}
	   		      
	   		        
	   		    
	   		    };
	   		    for (String[] row : data) {
	   		        table.addCell(createCell(row[0], 1, 1, Element.ALIGN_MIDDLE));
	   		        table.addCell(createCell(row[1], 1, 1, Element.ALIGN_LEFT));
	   		        table.addCell(createCell(row[2], 1, 1, Element.ALIGN_RIGHT));
	   		        table.addCell(createCell(row[3], 1, 1, Element.ALIGN_RIGHT));
	   		        table.addCell(createCell(row[4], 1, 1, Element.ALIGN_RIGHT));
	   		        
	   		     
	   		    }
	   		    
	   		    document.add(table);
	   		   
			
		}
		private PdfPCell createCell(String content, int borderWidth, int colspan, int alignment) {
			 PdfPCell cell = new PdfPCell(new Phrase(content));
			    cell.setBorderWidth(borderWidth);
			    cell.setColspan(colspan);
			    cell.setHorizontalAlignment(alignment);
			    
			    return cell;
			
		}
		

}
