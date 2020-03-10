package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pojo.Books;
import com.pojo.Reader;
import com.service.IBookService;
import com.service.IDateRecordService;
import com.service.IReaderService;
@SessionAttributes({"page","pageNum"})
@Controller
@RequestMapping("/reader")
public class ReaderController {
	@Autowired
	private IReaderService readerService;
	@Autowired
	private IBookService bookService;
	@Autowired
	private IDateRecordService dateRecordService;

	/**
	 * 添加读者借阅信息
	 *
	 * @param reader
	 * @return
	 */
	@RequestMapping("/insert")
	public String insert(Reader reader) {
		readerService.insert(reader);
		bookService.updateState(reader);
		dateRecordService.updateDate(reader.getReaderId(), reader.getBookId(), reader.getName());
		return "redirect:/date/borrowReturn";
	}
	/**
	 * 查询所有读者
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/allReaders")
	public String allReaders(Model model,Integer page) {
		List<Reader> readers = readerService.selectReaders(page);
		Integer pageNum=(int) Math.ceil(readerService.pageCount()/5.0);
		model.addAttribute("readers", readers);
		model.addAttribute("page",page);
		model.addAttribute("pageNum",pageNum);
		return "allReaders";
	}

	/**
	 * 根据readerId查询读者信息，并跳转到更新界面
	 *
	 * @param readerId
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateReader")
	public String updateReader(Integer readerId, Model model) {
		Reader update = readerService.selectOne(readerId);
		model.addAttribute("update", update);
		return "updateReader";
	}

	@RequestMapping("/reader_updateInfo")
	public String reader_updateInfo(Integer readerId, Model model) {
		Reader update = readerService.selectOne(readerId);
		model.addAttribute("update", update);
		return "reader_updateInfo";
	}

	/**
	 * 根据readerId更新读者信息，并跳转到更新界面
	 *
	 * @param reader
	 * @return
	 */
	@RequestMapping("/doUpdateReader")
	public String doUpdateReader(Reader reader) {
		readerService.doUpdateReader(reader);
		return "redirect:/reader/allReaders";
	}

	@RequestMapping("/reader_doUpdateReader")
	public String reader_doUpdateReader(Reader reader, Model model) {
		readerService.doUpdateReader(reader);
		Reader readerInfo = readerService.readerInfo(reader.getReaderId());
		model.addAttribute("readerInfo", readerInfo);
		return "reader_info";
	}
	@RequestMapping("/readerInfo")
	public String readerInfo(Integer readerId, Model model) {
		Reader readerInfo = readerService.readerInfo(readerId);
		model.addAttribute("readerInfo", readerInfo);
		return "reader_info";
	}
	/**
	 * 跳转到还书读者页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/returnReader")
	public String returnReaders(Model model) {
		List<Reader> readers = readerService.returnReaders();
		model.addAttribute("readers", readers);
		return "returnReader";
	}

	/**
	 * 跳转到读者信息界面
	 *
	 * @param model
	 * @param bookId
	 * @return
	 */
	@RequestMapping("/return")
	public String returnReader(Model model, Integer bookId) {
		Reader reader = readerService.returnReader(bookId);
		model.addAttribute("reader", reader);
		model.addAttribute("bookId", bookId);
		return "reader";
	}
	/**
	 * 跳转到增加读者界面
	 *
	 * @return
	 */
	@RequestMapping("/addReader")
	public String addReader() {
		return "addReader";
	}

	/**
	 * 增加读者
	 *
	 * @param reader
	 * @return
	 */
	@RequestMapping("/doAddReader")
	public String doAddReader(Reader reader) {
		readerService.addReader(reader);
		return "redirect:/reader/allReaders";
	}

	/**
	 * 根据readerId查询所借图书
	 *
	 * @param readerId
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectBooks")
	public String selectBooks(Integer readerId, Model model) {
		List<Books> books = readerService.selectBooks(readerId);
		model.addAttribute("books", books);
		return "borrowDetails";
	}
}
