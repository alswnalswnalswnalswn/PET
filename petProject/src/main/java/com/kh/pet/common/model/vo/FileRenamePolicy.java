package com.kh.pet.common.model.vo;

import java.io.File;

public interface FileRenamePolicy {
	
	    /**
	     * 파일 이름을 변경하는 메서드.
	     * 
	     * @param file 변경할 파일
	     * @return 변경된 파일 객체
	     */
	    public File rename(File file);
	    
}
