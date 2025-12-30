# **LIST UI COMPONENTS**

### 1. Text & Typography (Văn bản)

        Component           Cấu trúc lệnh                   Mô tả
    
        Text cơ bản         Text('Nội dung')                style: Dùng TextStyle(...) để chỉnh màu, font, size.
        
        Kiểu chữ (Style)    TextStyle(...)                  fontWeight: FontWeight.bold (Đậm)fontStyle: FontStyle.italic (Nghiêng)color: Màu sắcfontSize: Cỡ chữ
        
        RichText            Text.rich(TextSpan(...))        children: Danh sách các TextSpan con để tô màu từng đoạn chữ khác nhau trong cùng 1 dòng.


### 2. Buttons (Các loại Nút)

        Component       Cấu trúc lệnh                                             Mô tả
        
        Nút nổi         ElevatedButton(onPressed: (){}, child: Text('...'))       Nút có màu nền nổi lên, dùng cho hành động chính.
        
        Nút phẳng       TextButton(onPressed: (){}, child: Text('...'))           Nút không nền, chỉ có chữ, thường dùng trong Dialog.
        
        Nút viền        OutlinedButton(onPressed: (){}, child: Text('...'))       Nút có viền mỏng xung quanh.
        
        Nút Icon        IconButton(onPressed: (){}, icon: Icon(...))              Nút hình biểu tượng, không có khung.
        
        Nút trôi        FloatingActionButton(onPressed: (){}, child: ...)         Nút tròn thường nằm góc dưới màn hình.
        
        Nút Icon + Chữ  ElevatedButton.icon(icon: ..., label: ...)                Kết hợp cả biểu tượng và chữ.


### 3. Inputs & Selection (Nhập liệu)

        Component       Cấu trúc lệnh               Mô tả
        
        Ô nhập liệu     TextField(...)              obscureText: true (Ẩn mật khẩu)decoration: InputDecoration(hintText: '...') (Gợi ý/Viền).
        
        Hộp kiểm        Checkbox(...)               value: true/falseonChanged: Hàm chạy khi tick vào.
        
        Công tắc        Switch(...)                 value: true/falseonChanged: Hàm chạy khi gạt công tắc.
        
        Chọn 1 (Radio)  Radio(...)                  value: Giá trị của nút nàygroupValue: Giá trị hiện tại của nhóm(Nếu value == groupValue thì nút được chọn).
        
        Thanh trượt     Slider(...)                 value: Giá trị double (VD: 0.5 là 50%).


### 4. Images & Icons (Hình ảnh)

        Component       Cấu trúc lệnh               Mô tả
    
        Icon vector     Icon(Icons.tên_icon)        size: Kích thướccolor: Màu sắc.
    
        Ảnh Online      Image.network('url_ảnh')    fit: BoxFit.cover (Cắt ảnh vừa khung).
        
        Ảnh đại diện    CircleAvatar(...)           backgroundImage: NetworkImage(...) hoặc AssetImage(...)radius: Độ lớn bán kính.
    
        Ảnh Local       Image.asset('đường_dẫn')    Bắt buộc: Phải khai báo đường dẫn trong file pubspec.yaml trước.errorBuilder: Xử lý khi không tìm thấy ảnh.
        
        Giữ chỗ         Placeholder()               Vẽ một khung chéo để giữ chỗ khi chưa thiết kế xong.


### 5. Layouts (Bố cục)

        Component       Cấu trúc lệnh               Mô tả
    
        Hộp trang trí   Container(...)              decoration: Dùng BoxDecoration để chỉnh màu nền, bo góc (borderRadius), viền (border).
        
        Hàng ngang      Row(children: [])           Xếp các widget con từ trái sang phải.mainAxisAlignment: Căn chỉnh (giữa, giãn đều...).
        
        Xếp chồng       Stack(children: [])         Xếp các widget đè lên nhau (Layer).Dùng Positioned để chỉnh vị trí tuyệt đối (top, left...).


### 6. Feedback (Phản hồi)

        Component       Cấu trúc lệnh                                       Mô tả
    
        Loading xoay    CircularProgressIndicator()                         Vòng tròn xoay chờ tải dữ liệu.
    
        Loading ngang   LinearProgressIndicator()                           Thanh ngang chạy chờ tải dữ liệu.
    
        Thông báo       ScaffoldMessenger.of(context).showSnackBar(...)     Hiện dòng thông báo đen ở đáy màn hình.
        
        Hộp thoại       showDialog(...)                                     Hiện cửa sổ bật lên (Popup) giữa màn hình.


### 7. Pickers (Bộ chọn)

        Component       Cấu trúc lệnh                   Mô tả
        
        Chọn Ngày       showDatePicker(...)             firstDate, lastDate: Giới hạn khoảng thời gian.
        
        Chọn Giờ        showTimePicker(...)             initialTime: Giờ mặc định ban đầu.
        
        Menu thả        DropdownButton<String>(...)     items: Danh sách các lựa chọn (DropdownMenuItem).value: Giá trị đang được chọn.


### 8. List Nâng cao

        Component       Cấu trúc lệnh                   Mô tả
    
        Menu xổ         ExpansionTile(...)              title: Tiêu đề luôn hiện.children: Nội dung hiện ra khi bấm mở rộng.
        
        Vuốt xóa        Dismissible(...)                key: Khóa định danh duy nhất (Bắt buộc).onDismissed: Hàm chạy khi vuốt xong (thường dùng để xóa data).


### 9. Chips & Thẻ (Tags)

        Component       Cấu trúc lệnh                   Mô tả
    
        Bố cục gói      Wrap(children: [])              Giống Row nhưng tự động xuống dòng khi hết chỗ (rất tốt cho danh sách tags).
        
        Thẻ tin         Chip(...)                       avatar: Ảnh nhỏ bên trái.label: Nội dung chữ.onDeleted: Hiện nút X để xóa.
        
        Thẻ chọn        ChoiceChip(...)                 selected: true (được chọn) hoặc false.


### 10. Dialog & Sheet (Cửa sổ phụ)

        Component           Cấu trúc lệnh                           Mô tả
        
        Trượt dưới lên      showModalBottomSheet(...)               Hiện một bảng điều khiển trượt từ đáy màn hình lên.builder: Trả về widget nội dung bên trong sheet.
        
        Chú thích           Tooltip(message: '...', child: ...)     Khi người dùng nhấn giữ (long press) vào widget con, dòng message sẽ hiện ra.
