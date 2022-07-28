package kr.co.ejsoft.cims.system.service;

import kr.co.ejsoft.cims.system.dao.SystemDAO;
import kr.co.ejsoft.cims.system.model.CommonCodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * User: Naeyoung Kim
 * Date: 2018-12-23
 */
@Service
class SystemCachedService {
	@Autowired
	private SystemDAO systemDAO;

	@Cacheable("commonCodeMap")
	public Map<String, Map<String, CommonCodeVO>> getCommonCodeMap() {
		List<CommonCodeVO> commonCodeList = Optional.ofNullable(systemDAO.selectCommonCodeList()).orElseGet(ArrayList::new);;
		Map<String, Map<String, CommonCodeVO>> commonCodeMap = new HashMap<>();
		commonCodeList.forEach(commonCode -> {
			commonCodeMap.computeIfAbsent(commonCode.getGroupCd(), groupCd -> new HashMap<>());
			commonCodeMap.get(commonCode.getGroupCd()).put(commonCode.getCommonCd(), commonCode);
		});
		return commonCodeMap;
	}
}
