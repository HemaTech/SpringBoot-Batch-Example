package com.gmap.common;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.sql.Blob;

public class Pdf_Doc_download {

	public static byte[] getPhoto(Blob blob) throws Exception {
		final int MAXBUFSIZE = 204800;
		ByteArrayOutputStream bo=null;
		BufferedInputStream bis=null;
		try {
			 bis = new BufferedInputStream(
					blob.getBinaryStream());
			 bo = new ByteArrayOutputStream();
			byte[] buf = new byte[MAXBUFSIZE];
			int n = 0;
			while ((n = bis.read(buf, 0, MAXBUFSIZE)) != -1) {
				bo.write(buf, 0, n);
			}


			buf = null;

			return bo.toByteArray();
		} catch (Exception e) {
				
			e.printStackTrace();
		}finally{
			bo.flush();
			bo.close();
			bis.close();
            bo=null;
            bis=null;
		
			
		}
		return null;
	}
}
