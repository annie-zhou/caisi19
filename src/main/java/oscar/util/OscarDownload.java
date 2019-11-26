/**
 * Copyright (c) 2001-2002. Department of Family Medicine, McMaster University. All Rights Reserved.
 * This software is published under the GPL GNU General Public License.
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 * This software was written for the
 * Department of Family Medicine
 * McMaster University
 * Hamilton
 * Ontario, Canada
 */
package oscar.util;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OscarDownload extends GenericDownload  {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		String filename = req.getParameter("filename") != null ? req.getParameter("filename") : "null";
		String homepath = req.getParameter("homepath") != null ? req.getParameter("homepath") : "null";
		
		String backupfilepath = ((String) session.getAttribute(homepath)) != null ? ((String) session.getAttribute(homepath)) : "null";
		if (filename != null && backupfilepath != null && ((String) session.getAttribute("user")) != null) {
			ServletOutputStream stream = res.getOutputStream();
			transferFile(res, stream, backupfilepath, filename);
			stream.close();
		} else {
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.println("<html>");
			out.println("<head><body>You have no right to download the file(s).");
			out.println("</body>");
			out.println("</html>");
		}
	}
}
