package com.shoponline.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shoponline.dto.ItemDTO;
import com.shoponline.service.ICategoryService;
import com.shoponline.service.IItemService;
import com.shoponline.util.MessageUtil;
import com.shoponline.util.imagesFolder;

@Controller
public class ItemController {
	@Autowired
	private IItemService itemService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private MessageUtil messageUtil;

	@RequestMapping(value = "/admin/list", method = RequestMethod.GET)
	public ModelAndView showListPage(@RequestParam("page") int page, @RequestParam("limit") int limit,
			HttpServletRequest request) {
		ItemDTO model = new ItemDTO();
		model.setPage(page);
		model.setLimit(limit);
		/* model.setStatus(status); */
		ModelAndView mav = new ModelAndView("admin/product/list");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(itemService.findAll(pageable));
		model.setTotalItem(itemService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/admin/edit", method = RequestMethod.GET)
	public ModelAndView editItem(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request,
			Model model) {
		ModelAndView mav = new ModelAndView("admin/product/edit");
		model.addAttribute("item", new ItemDTO());
		if (id != null) {
			model = (Model) itemService.findbyId(id);
		}
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("model", model);
		return mav;
		/* model.addAttribute("product", new ItemDTO()); */

	}

	@Autowired
	private imagesFolder imagesfolder;

	@RequestMapping(value = "admin/save-product")
	public ModelAndView saveProduct(HttpServletRequest servletRequest, @ModelAttribute ItemDTO item, Model model)
			throws Exception {
		ModelAndView mav = new ModelAndView("admin/product/ProductDetails");
		List<MultipartFile> files = item.getThumbnail();
		MultipartFile imageFile1 = files.get(0);
		if (null != files && files.size() > 0) {

			File imageDir = new File(imagesfolder.getImagesFolder(), "image");
			if (imageDir.exists() != true) {
				imageDir.mkdirs();
			}
			File imageFile = new File(imageDir, imageFile1.getOriginalFilename());
			item.setUrlthumbnail("image/" + imageFile1.getOriginalFilename());
			try {
				/* create actual file */
				if (!imageFile.exists()) {
					imageFile.createNewFile();
				}
				Files.write(Paths.get(imageFile.getPath()), imageFile1.getBytes());
				/* imageFile1.transferTo(imageFile); */

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		itemService.save(item);
// save product here
		model.addAttribute("item", item);

		return mav;
	}

}
