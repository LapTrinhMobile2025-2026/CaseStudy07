import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All UI Components',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

// ==========================================
// 0. MÀN HÌNH CHÍNH (MENU DANH SÁCH)
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bộ Sưu Tập UI Flutter')),
      body: ListView(
        children: [
          _buildNavItem(context, "1. Text & Typography", const TextShowcaseScreen()),
          _buildNavItem(context, "2. Buttons (Các loại nút)", const ButtonShowcaseScreen()),
          _buildNavItem(context, "3. Inputs & Selection", const InputShowcaseScreen()),
          _buildNavItem(context, "4. Images & Icons", const ImageShowcaseScreen()),
          _buildNavItem(context, "5. Layouts (Container, Stack)", const LayoutShowcaseScreen()),
          _buildNavItem(context, "6. Feedback (Loading, Dialog)", const FeedbackShowcaseScreen()),
          _buildNavItem(context, "7. Pickers (Chọn Ngày/Giờ/Menu)", const PickerShowcaseScreen()),
          _buildNavItem(context, "8. List Nâng cao (Vuốt, Xổ xuống)", const AdvancedListScreen()),
          _buildNavItem(context, "9. Chips & Thẻ (Tags)", const ChipShowcaseScreen()),
          _buildNavItem(context, "10. Dialog & Sheet (Cửa sổ phụ)", const DialogSheetScreen()),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, Widget page) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      ),
    );
  }
}

// ==========================================
// 1. TEXT & TYPOGRAPHY SCREEN
// ==========================================
class TextShowcaseScreen extends StatelessWidget {
  const TextShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Các kiểu Text")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          // Cơ bản
          Text("Text thường: Hello World"),
          Divider(),

          // Style: Size & Weight
          Text("Text in đậm (Bold)", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Text in nghiêng (Italic)", style: TextStyle(fontStyle: FontStyle.italic)),
          Text("Text gạch chân (Underline)", style: TextStyle(decoration: TextDecoration.underline)),
          Text("Text gạch ngang (LineThrough)", style: TextStyle(decoration: TextDecoration.lineThrough)),
          Divider(),

          // Màu sắc & Font size
          Text("Text màu đỏ", style: TextStyle(color: Colors.red)),
          Text("Text size 30", style: TextStyle(fontSize: 30)),
          Text("Text nền vàng", style: TextStyle(backgroundColor: Colors.yellow)),
          Divider(),

          // RichText (Nhiều style trong 1 dòng)
          Text("RichText (Hỗn hợp):"),
          Text.rich(
            TextSpan(
              text: 'Một dòng có ',
              children: [
                TextSpan(text: 'màu xanh, ', style: TextStyle(color: Colors.blue)),
                TextSpan(text: 'in đậm, ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'và chữ to.', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. BUTTONS SCREEN
// ==========================================
class ButtonShowcaseScreen extends StatelessWidget {
  const ButtonShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Các loại Nút (Button)")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. ElevatedButton: Nút có nền nổi
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated Button (Nút nổi)"),
            ),

            // 2. TextButton: Nút chỉ có chữ (thường dùng trong dialog)
            TextButton(
              onPressed: () {},
              child: const Text("Text Button (Nút phẳng)"),
            ),

            // 3. OutlinedButton: Nút có viền
            OutlinedButton(
              onPressed: () {},
              child: const Text("Outlined Button (Nút viền)"),
            ),

            // 4. IconButton: Nút chỉ là icon
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up, color: Colors.blue, size: 30),
              tooltip: "Like", // Giữ chuột/tay sẽ hiện chữ này
            ),

            // 5. FloatingActionButton (Thường ở góc màn hình)
            FloatingActionButton.small(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            const Text("(Floating Action Button)"),

            // 6. Button có Icon + Text
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send),
              label: const Text("Gửi đi"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. INPUTS & SELECTION SCREEN (Stateful)
// ==========================================
class InputShowcaseScreen extends StatefulWidget {
  const InputShowcaseScreen({super.key});

  @override
  State<InputShowcaseScreen> createState() => _InputShowcaseScreenState();
}

class _InputShowcaseScreenState extends State<InputShowcaseScreen> {
  bool isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.5;
  int radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nhập liệu & Lựa chọn")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 1. TextField (Nhập văn bản)
          const Text("TextField (Cơ bản):"),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nhập tên của bạn...',
            ),
          ),
          const SizedBox(height: 10),

          const Text("TextField (Password):"),
          const TextField(
            obscureText: true, // Ẩn ký tự
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mật khẩu',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const Divider(height: 30),

          // 2. Checkbox (Chọn nhiều)
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (val) => setState(() => isChecked = val!),
              ),
              const Text("Checkbox (Đồng ý điều khoản)"),
            ],
          ),

          // 3. Switch (Bật/Tắt)
          Row(
            children: [
              Switch(
                value: isSwitched,
                onChanged: (val) => setState(() => isSwitched = val),
              ),
              const Text("Switch (Chế độ tối)"),
            ],
          ),
          const Divider(),

          // 4. Radio (Chọn 1 trong nhiều)
          const Text("Radio Button (Chọn giới tính):"),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: radioValue,
                onChanged: (val) => setState(() => radioValue = val!),
              ),
              const Text("Nam"),
              Radio(
                value: 2,
                groupValue: radioValue,
                onChanged: (val) => setState(() => radioValue = val!),
              ),
              const Text("Nữ"),
            ],
          ),
          const Divider(),

          // 5. Slider (Kéo trượt)
          Text("Slider (Âm lượng): ${(sliderValue * 100).toInt()}%"),
          Slider(
            value: sliderValue,
            onChanged: (val) => setState(() => sliderValue = val),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 4. IMAGES & ICONS SCREEN
// ==========================================
class ImageShowcaseScreen extends StatelessWidget {
  const ImageShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hình ảnh & Icons")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 1. Icon có sẵn
          const Text("1. Icons (Vector có sẵn):"),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.home, size: 40, color: Colors.blue),
              Icon(Icons.favorite, size: 40, color: Colors.red),
              Icon(Icons.settings, size: 40, color: Colors.grey),
            ],
          ),
          const Divider(),

          // 2. Network Image
          const Text("2. Image.network (Từ Internet):"),
          Image.network(
            'https://lh3.googleusercontent.com/gps-cs-s/AG0ilSxFu-ci_Fvt0cezQ7XiKu0CX3v3v6rJyFdZr7IKszEo0f_zkXZvSAq42gVke6NIp8H5-IAPPapui-3R3zqeY__73esm5XEWl_haWYQUX7JngnPVgtRL84rxPGNjoDcos0RvxIsH=s1360-w1360-h1020-rw',
            height: 150,
            fit: BoxFit.cover,
          ),
          const Divider(),

          // 3. CircleAvatar
          const Text("3. CircleAvatar (Ảnh tròn):"),
          const SizedBox(height: 10),
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/gps-cs-s/AG0ilSwppNwPjSg1Ax7yDAjt5RyUKYskOR_pTrM9i7mM6Qhm25azbT2kzXR0_EjE2cNBvIrWA-97ZnNvofMYDanvYU5iic6iy6SVLR4eEXZfn3NL2M_yZlsTzx8hnCYGM5x41h5_I0ixaQ=s1360-w1360-h1020-rw'),
            ),
          ),
          const Divider(),

          const Text("4. Image.asset (Ảnh từ máy local):"),
          const SizedBox(height: 5),
          const Text("(Yêu cầu file: assets/uth.png)", style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
            child: Image.asset(
              'assets/uth.png',
              height: 150,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Column(
                  children: [
                    Icon(Icons.broken_image, size: 50, color: Colors.grey),
                    Text("Chưa tìm thấy ảnh!", style: TextStyle(color: Colors.red)),
                    Text("Hãy tạo thư mục assets và copy ảnh vào."),
                  ],
                );
              },
            ),
          ),
          const Divider(),

          // 4. Placeholder (Giữ chỗ khi chưa có ảnh)
          const Text("4. Placeholder (Giữ chỗ):"),
          const SizedBox(
            height: 100,
            child: Placeholder(color: Colors.purple),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 5. LAYOUTS SCREEN
// ==========================================
class LayoutShowcaseScreen extends StatelessWidget {
  const LayoutShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bố cục (Layout)")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Text("1. Container (Hộp chứa trang trí):"),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blue, width: 2), // Viền
            ),
            child: const Text("Đây là Container có màu, viền và bo góc", textAlign: TextAlign.center),
          ),

          const Text("2. Row (Hàng ngang):"),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Chia đều khoảng cách
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
              ],
            ),
          ),

          const SizedBox(height: 10),
          const Text("3. Stack (Chồng lên nhau):"),
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                Container(color: Colors.red, width: 100, height: 100),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(color: Colors.green, width: 60, height: 60),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(color: Colors.yellow, width: 30, height: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 6. FEEDBACK SCREEN
// ==========================================
class FeedbackShowcaseScreen extends StatelessWidget {
  const FeedbackShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Phản hồi & Loading")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("CircularProgressIndicator (Xoay):"),
            const CircularProgressIndicator(),

            const Text("LinearProgressIndicator (Thanh ngang):"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(),
            ),

            const Divider(),

            ElevatedButton(
              onPressed: () {
                // Hiện SnackBar (Thông báo bên dưới màn hình)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Đây là SnackBar!")),
                );
              },
              child: const Text("Bấm để hiện SnackBar"),
            ),

            ElevatedButton(
              onPressed: () {
                // Hiện Dialog (Hộp thoại cảnh báo)
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Thông báo"),
                    content: const Text("Đây là Alert Dialog."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Đóng"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Bấm để hiện Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 7. PICKERS SCREEN (Ngày, Giờ, Dropdown)
// ==========================================
class PickerShowcaseScreen extends StatefulWidget {
  const PickerShowcaseScreen({super.key});

  @override
  State<PickerShowcaseScreen> createState() => _PickerShowcaseScreenState();
}

class _PickerShowcaseScreenState extends State<PickerShowcaseScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String dropdownValue = 'Tùy chọn 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chọn Ngày, Giờ & Menu")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 1. DATE PICKER
          const Text("1. DatePicker (Chọn ngày):"),
          ListTile(
            title: Text("Ngày chọn: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
            trailing: const Icon(Icons.calendar_today),
            tileColor: Colors.blue[50],
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2025),
              );
              if (picked != null) setState(() => selectedDate = picked);
            },
          ),
          const SizedBox(height: 20),

          // 2. TIME PICKER
          const Text("2. TimePicker (Chọn giờ):"),
          ListTile(
            title: Text("Giờ chọn: ${selectedTime.hour}:${selectedTime.minute}"),
            trailing: const Icon(Icons.access_time),
            tileColor: Colors.orange[50],
            onTap: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: selectedTime,
              );
              if (picked != null) setState(() => selectedTime = picked);
            },
          ),
          const SizedBox(height: 20),

          // 3. DROPDOWN BUTTON
          const Text("3. Dropdown (Menu thả xuống):"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: dropdownValue,
              isExpanded: true, // Để menu rộng full bề ngang
              underline: const SizedBox(), // Bỏ gạch chân mặc định
              onChanged: (String? newValue) {
                setState(() => dropdownValue = newValue!);
              },
              items: <String>['Tùy chọn 1', 'Tùy chọn 2', 'Tùy chọn 3', 'Tùy chọn 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 8. ADVANCED LIST (Vuốt xóa, Menu đa cấp)
// ==========================================
class AdvancedListScreen extends StatelessWidget {
  const AdvancedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Nâng cao")),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text("1. ExpansionTile (Menu xổ xuống):"),
          ),
          const ExpansionTile(
            leading: Icon(Icons.info),
            title: Text("Bấm vào đây để xem thêm"),
            children: [
              ListTile(title: Text("Nội dung con 1")),
              ListTile(title: Text("Nội dung con 2")),
              ListTile(title: Text("Nội dung con 3")),
            ],
          ),

          const Divider(thickness: 2),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text("2. Dismissible (Vuốt ngang để xóa - Thử vuốt xem!):"),
          ),
          // Tạo danh sách giả 3 phần tử để vuốt
          ...List.generate(3, (index) {
            return Dismissible(
              key: ValueKey(index), // Key duy nhất
              background: Container(color: Colors.red, alignment: Alignment.centerLeft, child: const Icon(Icons.delete, color: Colors.white)),
              secondaryBackground: Container(color: Colors.green, alignment: Alignment.centerRight, child: const Icon(Icons.archive, color: Colors.white)),
              onDismissed: (direction) {
                // Xử lý khi xóa xong (thường là xóa data)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Đã xóa mục số $index")));
              },
              child: ListTile(
                leading: CircleAvatar(child: Text("$index")),
                title: Text("Mục danh sách số $index"),
                subtitle: const Text("Vuốt sang trái hoặc phải..."),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ==========================================
// 9. CHIPS & TAGS SCREEN
// ==========================================
class ChipShowcaseScreen extends StatelessWidget {
  const ChipShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chips & Thẻ tags")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("1. Chip (Thẻ thông tin):"),
            const SizedBox(height: 10),
            const Wrap( // Wrap giúp tự xuống dòng khi hết chỗ
              spacing: 10, // Khoảng cách ngang
              runSpacing: 10, // Khoảng cách dọc
              children: [
                Chip(
                  avatar: CircleAvatar(child: Text("A")),
                  label: Text("Nguyễn Văn A"),
                ),
                Chip(
                  avatar: Icon(Icons.star, size: 18),
                  label: Text("VIP Member"),
                  backgroundColor: Colors.amberAccent,
                ),
                Chip(
                  label: Text("Flutter"),
                  deleteIcon: Icon(Icons.cancel),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Text("2. ChoiceChip (Chọn 1 cái):"),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 10,
              children: [
                ChoiceChip(label: Text("Size S"), selected: false),
                ChoiceChip(label: Text("Size M"), selected: true, selectedColor: Colors.blueAccent),
                ChoiceChip(label: Text("Size L"), selected: false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 10. DIALOG & BOTTOM SHEET
// ==========================================
class DialogSheetScreen extends StatelessWidget {
  const DialogSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cửa sổ phụ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // HIỆN BOTTOM SHEET
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Đây là Bottom Sheet (Trượt từ dưới lên)'),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              child: const Text('Đóng lại'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text("Hiện Bottom Sheet"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // HIỆN TOOLTIP
              },
              // Bọc nút bằng Tooltip
              child: const Tooltip(
                message: "Đây là giải thích khi giữ nút lâu",
                child: Text("Giữ nút này (Long Press)"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}