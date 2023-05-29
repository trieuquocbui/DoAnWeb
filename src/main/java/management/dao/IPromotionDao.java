package management.dao;

import java.util.List;

import management.entity.DetailsPromotion;
import management.entity.DetailsPromotionPk;
import management.entity.Promotion;

public interface IPromotionDao {
List<Promotion> getAllKM();
	
	Promotion getKM(String makm);
	
	Integer updatePromotion(Promotion km);
	
	Integer insertPromotion(Promotion km);
	
	String creatMaKM();
	
	Integer insertDetailsPromotion(DetailsPromotion pr);
	
	Integer updateDetailsPromotion(DetailsPromotion pr);
	
	DetailsPromotion getDetailsPromotion(String masp, String makm);
	
	List<Object[]> listDetailsPromotion();
}
