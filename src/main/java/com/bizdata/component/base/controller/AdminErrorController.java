package com.bizdata.component.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author 顾剑峰<br/>
 *         创建时间：2015年12月17日 下午5:41:47<br/>
 *         描述：用户管理授权失败Controller，用于跳转到
 */
@Controller
@RequestMapping("/error")
public class AdminErrorController {

	/**
	 * @author 顾剑峰<br/>
	 *         创建时间：2015年12月17日 下午6:54:40<br/>
	 *         描述：跳转到401未授权页面
	 * @return
	 */
	@RequestMapping(value = "/401", method = RequestMethod.GET)
	public String error_401() {
		return "error/401-error";
	}

	/**
	 * @author 顾剑峰<br/>
	 *         创建时间：2015年12月17日 下午7:23:45<br/>
	 *         描述：跳转到500系统错误页面
	 * @return
	 */
	@RequestMapping(value = "/500", method = RequestMethod.GET)
	public String error_500() {
		return "error/500-error";
	}
}
