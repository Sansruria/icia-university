package kr.ac.icia.dto.common;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Paging {
    private int nowPage;   // 현재페이지
    private int startPage; // 시작페이지
    private int endPage;   // 끝페이지
    private int total;     // 게시글 총 갯수
    private int cntPerPage;// 페이지당 글 갯수
    private int lastPage;  // 마지막페이지
    private int start;     // SQL에 사용할 start
    private int end;       // SQL에 사용할 end
    private int cntPage = 5;
    public boolean isModal = false; // 모달여부

    public Paging(int total, int nowPage, int cntPerPage) {
        setNowPage(nowPage);
        setCntPerPage(cntPerPage);
        setTotal(total);
        calcLastPage(getTotal(), getCntPerPage());
        calcStartEndPage(getNowPage(), cntPage);
        calcStartEnd(getNowPage(), getCntPerPage());
    }

    // 제일 마지막 페이지 계산
    public void calcLastPage(int total, int cntPerPage) {
        setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
    }

    // 시작, 끝 페이지 계산
    public void calcStartEndPage(int nowPage, int cntPage) {
        setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
        if (getLastPage() < getEndPage()) {
            setEndPage(getLastPage());
        }
        setStartPage(getEndPage() - cntPage + 1);
        if (getStartPage() < 1) {
            setStartPage(1);
        }
    }

    // DB 쿼리에서 사용할 start, end값 계산
    public void calcStartEnd(int nowPage, int cntPerPage) {
        setEnd(nowPage * cntPerPage);
        setStart(getEnd() - cntPerPage + 1);
    }

    public String makePagingHtml() {
        String str = "<nav><ul id=\\\"pagingModal\\\" class=\\\"pagination justify-content-center\\\">";

        if (startPage != 1) {
            str += "<li class=\\\"page-item\\\">" +
                       "<a class=\\\"page-link\\\" href=\\\"#\\\" onclick=\\\"prev()\\\" aria-label=\\\"Previous\\\">" +
                           "<span aria-hidden=\\\"true\\\">&laquo;</span>" +
                       "</a>" +
                   "</li>";
        }

        for (int page = startPage; page <= endPage; page++) {
            if (page == nowPage) {
                str += "<li class=\\\"page-item disabled\\\"><a class=\\\"page-link\\\" href=\\\"#\\\">" + page + "</a></li>";
            }

            if (page != nowPage) {
                if (isModal) {
                   str += "<li class=\\\"page-item\\\"><a class=\\\"page-link\\\" href=\\\"#\\\" onclick=\\\"searchAndPagingModal('" + page + "')\\\">" + page + "</a></li>";
                } else {
                   str += "<li class=\\\"page-item\\\"><a class=\\\"page-link\\\" href=\\\"#\\\" onclick=\\\"selectedPage('" + page + "')\\\">" + page + "</a></li>";
                }
            }
        }

        if (endPage != lastPage) {
            str += "<li class=\\\"page-item\\\">" +
                        "<a class=\\\"page-link\\\" href=\\\"#\\\" onclick=\\\"next()\\\" aria-label=\\\"Next\\\">" +
                            "<span aria-hidden=\\\"true\\\">&raquo;</span>" +
                        "</a>" +
                    "</li>";
        }

        str += "</ul></nav>";

        return str;
    }

}
