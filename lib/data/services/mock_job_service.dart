import '../../domain/models/gig_job.dart';

class MockJobService {
  Future<List<GigJob>> fetchUrgentJobs() async {
    return const [
      GigJob(
        id: 'shift-barista-01',
        title: 'Barista ca tối',
        employerName: 'Katinat Nguyễn Huệ',
        location: 'Quận 1, TP.HCM',
        shiftTime: '18:00 - 22:30 hôm nay',
        wageLabel: '35k/giờ',
        statusLabel: 'Gấp',
        isVerified: true,
        tags: ['F&B', 'Part-time', 'Thanh toán nhanh'],
        description:
            'Phụ trách pha chế cơ bản, chuẩn bị nguyên liệu và hỗ trợ quầy trong khung giờ cao điểm.',
      ),
      GigJob(
        id: 'shift-server-02',
        title: 'Nhân viên phục vụ sự kiện',
        employerName: 'The Coffee House',
        location: 'Thủ Đức, TP.HCM',
        shiftTime: '07:00 - 12:00 ngày mai',
        wageLabel: '42k/giờ',
        statusLabel: 'Đang tuyển',
        isVerified: true,
        tags: ['Sự kiện', 'Không yêu cầu kinh nghiệm'],
        description:
            'Đón khách, set up bàn, phục vụ đồ uống và phối hợp với quản lý ca trong sự kiện sáng.',
      ),
      GigJob(
        id: 'shift-kitchen-03',
        title: 'Phụ bếp ca trưa',
        employerName: 'Bếp Mây',
        location: 'Bình Thạnh, TP.HCM',
        shiftTime: '10:00 - 14:00 thứ Sáu',
        wageLabel: '38k/giờ',
        statusLabel: 'Xác minh',
        isVerified: false,
        tags: ['Bếp', 'Ca ngắn'],
        description:
            'Sơ chế nguyên liệu, đóng gói phần ăn và giữ khu vực bếp sạch theo checklist của cửa hàng.',
      ),
    ];
  }
}
