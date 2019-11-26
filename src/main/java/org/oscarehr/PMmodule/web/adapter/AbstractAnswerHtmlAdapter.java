/**
 *
 * Copyright (c) 2005-2012. Centre for Research on Inner City Health, St. Michael's Hospital, Toronto. All Rights Reserved.
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
 * This software was written for
 * Centre for Research on Inner City Health, St. Michael's Hospital,
 * Toronto, Ontario, Canada
 */

package org.oscarehr.PMmodule.web.adapter;

import org.oscarehr.PMmodule.model.Intake;
import org.oscarehr.PMmodule.model.IntakeNode;

abstract public class AbstractAnswerHtmlAdapter extends AbstractHtmlAdapter {
	
	protected AbstractAnswerHtmlAdapter(int indent, IntakeNode node, Intake intake) {
	    super(indent, node, intake);
    }
	
	protected AbstractAnswerHtmlAdapter(int indent, IntakeNode node) {
		super(indent, node);
	}

	protected StringBuilder startRow(StringBuilder builder) {
		indent(builder).append("<tr>").append(EOL);
		beginTag();

		//for (int i = 0; i < getDistanceToQuestionLevel() - 1; i++) {
			indent(builder).append("<td class=\"intakeEmptyCell\"></td>").append(EOL);
        //}

		return builder;
	}
	
	protected StringBuilder endRow(StringBuilder builder) {
		endTag();
		indent(builder).append("</tr>").append(EOL);
		
		return builder;
	}

	protected StringBuilder startCell(StringBuilder builder) {
		int distance = 5;
		indent(builder).append("<td class=\"intakeAnswerCell\" colspan=\"").append(distance).append("\">").append(EOL);
		beginTag();
		
		return builder;
	}
	
	protected StringBuilder endCell(StringBuilder builder) {
		endTag();
		indent(builder).append("</td>").append(EOL);
		
		return builder;
	}
	
}
