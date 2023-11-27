<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
 <title>Web bán hàng</title>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,500;0,700;1,500&family=Rubik+Distressed&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
 <link rel="stylesheet" href="fontawesome-free-6.3.0-web/css/all.min.css">
 <link rel="stylesheet" href="./css/check.css">
 <link rel="stylesheet" href="./css/form.css">
  <link rel="stylesheet" href="./css/product-detail.css">

 <script src="./js/detail-product.js"></script>
 <script src="https://kit.fontawesome.com/6d254ad403.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="header">
        <div class="header_icon">
            <ul class="headericon">
                <li class="icon1">
                    <a href=""><i class="fa-brands fa-facebook" style="color:black"></i></a>
                </li>
                <li class="icon1">
                    <a href=""><i class="fa-brands fa-twitter" style="color:black"></i></a>
                </li>
                <li class="icon1">
                    <a href=""><i class="fa-brands fa-google-plus-g" style="color:black"></i></a>
                </li>
                <li class="icon1">
                    <a href=""><i class="fa-brands fa-youtube" style="color:black"></i></a>
                </li>
                <li class="icon1">
                    <a href=""><i class="fa-brands fa-linkedin-in" style="color:black"></i></a>
                </li>
    
            </ul>
        </div>
        <div class="header_item">
            <ul class="item_logo">
               <li class="logo">
                   <a href="text.jsp"> <img src="http://cdn0308.cdn4s.com/media/logo/logo.png"></a>
               </li>
            </ul>
            <ul class="item_navbar">
                    <li class="navbar">
                        <a href="sanpham.html">Sản phẩm</a>
                        <div class="header_navbar">
                            <ul class="header_navbar-sanpham">
                                <li>
                                    <a href="Docking.html">Docking Station</a>
                                </li>
                                <li>
                                    <a href="hub.html">HUBS</a>
                                </li>
                                <li >
                                    <a href="cap.html">Cáp các loại</a>
                                </li>
                                <li >
                                    <a href="phukien.html">Phụ kiện khác</a>
                                </li>
                            </ul>                          
                        </div>
                    </li> 
                    <li class="navbar">
                        <a href="support.html">Hỗ trợ</a>
                    </li>   
                    <li class="navbar">
                        <a href="about-us.html">Về chúng tôi</a>
                    </li>
                    <li class="navbar">
                        <a href="liên-hệ.html">Mua ở đâu</a>
                    </li>
                    <li class="navbar">
                        <a href="group.html">Group</a>
                    </li>
             </ul>
            
        </div>
        
        <div class="classify">
            <div class="header_header">
                <div class="header_header1">
                    <a href="Docking.html">Docking Stations</a>
                </div>
                <div class="header_header2">
                    <a href="hub.html">HUBS</a>
                </div>
                <div class="header_header3">
                    <a href="cap.html">Charger&Cables</a>
                </div>
                <div class="header_header4">
                    <a href="phukien.html">Other Accessones</a>
                </div>
            </div>
            <div class="select">
                <h1 style="text-align: center;">Trung tâm của bạn, Lựa chọn của bạn</h1>
                <p style="text-align: center;">Máy tính của bạn kết nối với những cổng USB nào?</p>
            </div>
            <div class="select1">
                <div class="table_tb1">
                      <div class="haz_hubs">
                         <a href="hub.html">HUBS</a>
                       </div>
                </div>
                <div class="table_tb2">
                    <div class="haz_cap">
                         <a href="cap.html">Cáp các loại</a>
                    </div>  
                </div>    
            </div>  
        </div>
    </div>
    <div class="container">
        <div class="grid__row">
            <c:forEach items="${product}" var="product">
                <div class="grid__column-4" style="margin-left: 48px;">
                    <div class="item-border">
                        <a href="http://lention.vn/" class="item-list__img" target="_blank" title="">
                            <div class="item-list__img--display" style="background-image:url(http://cdn0308.cdn4s.com/thumbs/san-pham/h23-1_thumb_350.jpg)">
                            </div>
                            <div class="item-list__img--hidden" style="background-image:url(http://cdn0308.cdn4s.com/thumbs/san-pham/hubs/c35-1m-1_thumb_350.jpg)">
                            </div>
                            <div class="item-list__img--outstand">
                                nổi bật
                            </div>
                            <div class="item-list__img--option">
                                <ul class="item-list__img--option-list">
                                    <li class="item-list__img--option-item">
                                        <div href="" class="item-list__img--option-link" title="Mua hàng" target="_blank">
                                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                        </div>
                                    </li>
                                    <li class="item-list__img--option-item">
                                        <a href="" class="item-list__img--option-link" title="xem nhanh" id="open">
                                           <i class="fa-solid fa-eye"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </a>
                        
                        <div class="item-list__description">
                            <a href="" class="item-list__description-title">
                              ${product.name}
                            </a>
                          </div>
                        <div class="item-list__price">
                            <div class="item-list__price-num">
                                ${product.price} <span style="font-size:1.1rem">VND</span>
                                
                            </div>
                            <div class="item-list__price-star">
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                <i class="item-list__price-star-icon fa-solid fa-star"></i>
    
                            </div>
                        </div>
                    </div>
                </div>
                
            </c:forEach>
        </div>    
    </div>
    <div class="footer">
        <div class="boxcenter">
            <div class="row1">
              <a href="">
                <img
                  src="http://cdn0308.cdn4s.com/media/gioi-thieu/gioi-thieu.jpg"
                  style="width: 960px; height: 430px"
                />
              </a>
            </div>
            <div class="row2">
              <h2 class="heading" style="font-size: 150%">
                CÔNG TY CỔ PHẦN THƯƠNG <br />
                MẠI KIẾN HƯNG VIỆT NAM
              </h2>
              <div>
                 LENTION là thương hiệu toàn cầu chuyên về phụ kiện kỹ thuật số như bộ
                điều hợp, chuyển đổi, đế cắm, cáp và các phụ kiện dành cho laptop,
                tablet khác, cung cấp các giải pháp tốt nhất và đáp ứng nhu cầu sáng
                tạo cho khách hàng.
              </div>
              <br />
              <div>
                Là một thương hiệu dựa trên khách hàng, Lention nhấn mạnh vào việc
                kiểm soát chất lượng nghiêm ngặt và hoàn thành các dịch vụ sau bán
                hàng. Bằng cách chia sẻ ý tưởng về các sản phẩm và dịch vụ, chúng tôi
                hy vọng mọi khách hàng đều có thể cảm nhận được sự cải tiến và lợi ích
                mang lại từ các sản phẩm và nhận ra khái niệm LENTION. KIẾN HƯNG tự
                hào là nhà phân phối chính hãng các sản phẩm mang thương hiệu LENTION,
                quý khách có nhu cầu đặt hàng vui lòng liên hệ chúng tôi để biết thêm
                chi tiết.
              </div>
            </div>
          </div>
          <hr class="hrColor" />
          <div class="table">
            <div class="table1">
              <h3 class="heading" style="font-size: 130%">
                                CÔNG TY CỔ PHẦN THƯƠNG MẠI KIẾN HƯNG VIỆT NAM
              </h3>
              <div class="info">
                 <div>
                  KIẾN HƯNG tự hào là nhà phân phối chỉnh hãng các sản phẩm mang
                  thương hiệu LENTION, quý khách có nhu cầu <br />đặt hàng vui lòng
                  liên hệ chúng tôi để biết thêm chi tiết.
                </div>
                <br />
                <div>
                   <b>Địa chỉ :</b> Số nhà 5A, ngõ 4, đường Lý Tự Trọng, Phường La Khê,
                  Quận Hà Đông
                </div>
                <br />
                <div><b>Số điện thoại : </b>0922103999</div>
                <br />
               <div><b>Email :</b> kienhungvncompany@gmail.com</div>
                <br />
               <div>Thời gian làm việc: 8-17h</div>
                <br />
                <div class="icon-container">
                  <div class="icon">
                    <a href=""><i class="fa-brands fa-facebook-f"></i></a>
                  </div>
                  <div class="icon">
                    <a href=""><i class="fa-brands fa-twitter"></i></a>
                  </div>
                  <div class="icon">
                    <a><i class="fa-brands fa-google-plus-g"></i></a>
                  </div>
                  <div class="icon">
                    <a href=""><i class="fa-brands fa-youtube"></i></a>
                  </div>
                  <div class="icon">
                    <a href=""><i class="fa-brands fa-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
      
            <div class="table2">
              <ul class="row_boxfooter2">
                <h3 class="heading" style="font-size: 130%">VỀ CHÚNG TÔI</h3>
                <p><a href="">Liên hệ</a></p>
                <p><a href="">Chính sách vận chuyển</a></p>
                <p><a href="">Chính sách bảo hành</a></p>
                <p><a href="">Chính sách đổi trả</a></p>
                <p><a href="">Tin khuyến mãi</a></p>
                <p><a href="">Hệ thống đại lý</a></p>
              </ul>
            </div>
      
            <div class="table3">
              <div class="row boxfooter3">
                <h3 class="heading" style="font-size: 130%">MAP</h3>
                <iframe
                  src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14902.090252383596!2d105.769882!3d20.97168!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313453262cb85207%3A0x2c3d48f455e506c!2zNCBMw70gVOG7sSBUcuG7jW5nLCBQLiBRdWFuZyBUcnVuZywgSMOgIMSQw7RuZywgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2sus!4v1678213773058!5m2!1svi!2sus"
                  width="300"
                  height="300"
                  style="border: 0"
                  allowfullscreen=""
                  loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade"
                ></iframe>
              </div>
            </div>
          </div>
          <div class="copyright">
            <hr class="hrColor" />
            <p>Copyright © 2021 Lention All rights reserved.</p>
          </div>
    </div>
    
</body>
</html>