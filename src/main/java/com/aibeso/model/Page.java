package com.aibeso.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * <p>
 * 分页模型
 * </p>
 *
 * @author aibeso
 * @since 2019-03-17
 */
public class Page<T>{
	  public static final String ORDER_DESC = "desc";
	  public static final String ORDER_ASC = "asc";
	  private int page = 1;
	  private int rows = 10;
	  private String sidx;
	  private String sord;
	  private int totalpage;
	  private int totalrecords;
	  private List<T> results;
	  private Map<String, Object> params = new HashMap();
	  
	  public int getPage()
	  {
	    return this.page;
	  }
	  
	  public void setPage(int page)
	  {
	    this.page = page;
	  }
	  
	  public int getRows()
	  {
	    return this.rows;
	  }
	  
	  public void setRows(int rows)
	  {
	    this.rows = rows;
	  }
	  
	  public int getTotalpage()
	  {
	    return this.totalpage;
	  }
	  
	  public void setTotalpage(int totalpage)
	  {
	    this.totalpage = totalpage;
	  }
	  
	  public int getTotalrecords()
	  {
	    return this.totalrecords;
	  }
	  
	  public void setTotalrecords(int totalrecords)
	  {
	    this.totalrecords = totalrecords;
	  }
	  
	  public String getSidx()
	  {
	    return this.sidx;
	  }
	  
	  public void setSidx(String sidx)
	  {
	    this.sidx = sidx;
	  }
	  
	  public String getSord()
	  {
	    return this.sord;
	  }
	  
	  public void setSord(String sord)
	  {
	    this.sord = sord;
	  }
	  
	  public List<T> getResults()
	  {
	    return this.results;
	  }
	  
	  public void setResults(List<T> results)
	  {
	    this.results = results;
	  }
	  
	  public Map<String, Object> getParams()
	  {
	    return this.params;
	  }
	  
	  public void setParams(Map<String, Object> params)
	  {
	    this.params = params;
	  }

	@Override
	public String toString() {
		return "Page [page=" + page + ", rows=" + rows + ", sidx=" + sidx + ", sord=" + sord + ", totalpage=" + totalpage
				+ ", totalrecords=" + totalrecords + ", results=" + results + ", params=" + params + "]";
	}
	  
	}
