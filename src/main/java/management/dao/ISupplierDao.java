package management.dao;

import java.util.List;

import org.hibernate.hql.internal.ast.tree.BooleanLiteralNode;

import management.entity.Supplier;

public interface ISupplierDao {
	
	boolean addSupplier(Supplier supplier);
	Long getNumberOfCustomer();
	List<Supplier> get_ListSupplier();
}
