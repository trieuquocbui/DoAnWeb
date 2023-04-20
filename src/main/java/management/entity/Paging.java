package management.entity;

public class Paging {
	private Integer page;
	private Integer maxPageItem;
	private Integer totalPage;
	private long totalItem;
	private String sortName;
	private String sortBy;
	private String search;
	
	public Paging() {
		super();
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getMaxPageItem() {
		return maxPageItem;
	}
	public void setMaxPageItem(Integer maxPageItem) {
		this.maxPageItem = maxPageItem;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public long getTotalItem() {
		return totalItem;
	}
	public void setTotalItem(long l) {
		this.totalItem = l;
	}
	public String getSortName() {
		return sortName;
	}
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "Paging [page=" + page + ", maxPageItem=" + maxPageItem + ", totalPage=" + totalPage + ", totalItem="
				+ totalItem + ", sortName=" + sortName + ", sortBy=" + sortBy + ", search=" + search + "]";
	}
	
	
}
