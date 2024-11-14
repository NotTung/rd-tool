# Tài liệu hướng dẫn - Công cụ Tự động đăng bài Reddit

<p>Đây là một công cụ tự động đăng bài lên Reddit sử dụng AutoIT. Công cụ này đọc dữ liệu từ một file .txt và thực hiện đăng bài trên Reddit bằng cách điều khiển trình duyệt (Firefox/Edge).</p> <br>

Yêu cầu

    Cài đặt AutoIT (https://www.autoitscript.com/site/autoit/downloads/)
    Trình duyệt Firefox (có sẵn trong máy) hoặc Microsoft Edge
    File dữ liệu định dạng .txt chứa các bài đăng

Cấu trúc File data.txt

File data.txt chứa danh sách các bài đăng với định dạng mỗi dòng như sau:

<Title>|<Body>

Ví dụ:

This is a title|This is the body content of the post
Another title|Another body content

Lưu ý: Title và Body phải được phân tách bằng ký tự |.
Hướng dẫn Sử dụng

    Thiết lập Đường dẫn File Dữ liệu:
        Đảm bảo đường dẫn tới file dữ liệu data.txt là chính xác. Đường dẫn được thiết lập trong mã như sau:

    Global $txtFile = "D:\data_reddit\data.txt"

Chỉnh sửa Tọa độ Click:

    Tọa độ MouseClick có thể cần thay đổi để phù hợp với độ phân giải màn hình hoặc giao diện trình duyệt của bạn. Các vị trí cần kiểm tra tọa độ:

        MouseClick("left", 800, 600) ; check this

    Chạy Mã:
        Khởi chạy mã AutoIT từ môi trường phát triển hoặc tạo tệp .exe và thực thi. Mã sẽ mở trình duyệt, đăng nhập vào Reddit và đăng các bài viết từ file data.txt.

Giải thích Các Hàm Chính

1. Hàm ReadTXT($filePath)

Hàm này đọc dữ liệu từ file .txt và lưu lại trong mảng $data, sau đó trả về mảng chứa tiêu đề và nội dung của từng bài viết.

Func ReadTXT($filePath)

2. Hàm PostToReddit($title, $body)

Hàm này thực hiện các thao tác điều khiển trình duyệt để đăng bài lên Reddit. Cụ thể:

    Mở trình duyệt và truy cập trang tạo bài viết của Reddit.
    Điều hướng và nhập tiêu đề, nội dung vào các trường yêu cầu.
    Nhấn nút "Post" để đăng bài.

Func PostToReddit($title, $body)

3. Vòng lặp Chính

Đọc tất cả các bài đăng từ file và thực hiện đăng mỗi bài một lần.

Local $posts = ReadTXT($txtFile)
For $i = 0 To UBound($posts) - 1
PostToReddit($posts[$i][0], $posts[$i][1])
Next

Lưu ý

    Đăng nhập Reddit trước khi chạy mã để tránh phải thực hiện thao tác đăng nhập.

