//
//  ITDAScreens.swift
//  IT-DA-iOS
//
//  Created by Codex on 7/21/26.
//

import SwiftUI

struct ITDAProject {
    let title: String
    let subtitle: String
    let status: String
    let chips: [String]
    let meta: String
}

struct ITDANotification {
    let iconName: String
    let title: String
    let date: String
}

private enum ITDAUI {
    static let text = Color(red: 0.29, green: 0.29, blue: 0.29)
    static let subText = Color(red: 0.55, green: 0.55, blue: 0.55)
    static let button = Color(red: 0.27, green: 0.27, blue: 0.27)
    static let border = Color(red: 0.82, green: 0.82, blue: 0.82)
    static let lightBorder = Color(red: 0.88, green: 0.88, blue: 0.88)
    static let fieldBorder = Color(red: 0.58, green: 0.58, blue: 0.58)
    static let background = Color.white
}

private let sampleProjects = [
    ITDAProject(
        title: "AI 기반 학습 플래너 [야무야]",
        subtitle: "백엔드 개발자 1명 모집",
        status: "모집 중",
        chips: ["Back-end"],
        meta: "IoT과 · 2명, SW과 1명 참여"
    ),
    ITDAProject(
        title: "하자돼 키우기 [하키]",
        subtitle: "프론트엔드 개발자 2명 모집",
        status: "모집 중",
        chips: ["Back-end"],
        meta: "IoT과 · 2명, SW과 1명 참여"
    ),
    ITDAProject(
        title: "닮은 포켓몬 검사 [포켓몬백]",
        subtitle: "iOS 개발자 · 1명 · 디자이너 1명 모집",
        status: "마감 임박",
        chips: ["iOS", "Design"],
        meta: "IoT과 · 2명, SW과 1명 참여"
    )
]

private let sampleNotifications = [
    ITDANotification(iconName: "tnwjd", title: "새로운 프로젝트에서 수현씨가 초대하였습니다!", date: "2분전"),
    ITDANotification(iconName: "rectangle 1", title: "백엔드 개발자 1명이 프로젝트를 함께 하였습니다!", date: "2분전")
]

struct ITDAMainTabView: View {
    @State private var selectedTab: ITDATab = .home
    @State private var showsCreateProject = false

    var body: some View {
        VStack(spacing: 0) {
            currentScreen

            ITDABottomTabBar(
                selectedTab: $selectedTab,
                onCreateTap: { showsCreateProject = true }
            )
        }
        .ignoresSafeArea(edges: .bottom)
        .sheet(isPresented: $showsCreateProject) {
            ITDATeamCreateView()
        }
    }

    @ViewBuilder
    private var currentScreen: some View {
        switch selectedTab {
        case .home:
            ITDAHomeView()
        case .explore:
            ITDAProjectDetailView()
        case .notification:
            ITDANotificationView()
        case .my:
            ITDAProfileView()
        }
    }
}

struct ITDAHomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "Home")

            ScrollView {
                VStack(alignment: .leading, spacing: 26) {
                    ITDAProfileSummary()
                    ITDAProjectStatsCard(items: [("지원 중", "3"), ("참여 중", "1"), ("완료", "1")])

                    sectionHeader("추천 프로젝트")

                    ForEach(sampleProjects, id: \.title) { project in
                        ITDAProjectCard(
                            title: project.title,
                            subtitle: project.subtitle,
                            status: project.status,
                            chip1: project.chips.indices.contains(0) ? project.chips[0] : "",
                            chip2: project.chips.indices.contains(1) ? project.chips[1] : "",
                            chip3: project.chips.indices.contains(2) ? project.chips[2] : "",
                            meta: project.meta
                        )
                    }

                    sectionHeader("참여 중인 프로젝트")

                    ITDAProjectCard(
                        title: "사랑을 이어주는 앱 [탬탬]",
                        subtitle: "내 역할 : iOS 개발",
                        status: "진행 중",
                        chip1: "",
                        meta: "팀원 4명 · 마감 2026-05-31",
                        trailingText: "자세히 보기"
                    )

                    sectionHeader("알림 요약 · 확인")

                    VStack(spacing: 10) {
                        ForEach(sampleNotifications, id: \.title) { notification in
                            ITDANotificationRow(notification: notification)
                        }

                        Button("모든 알림 보기") {}
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(ITDAUI.subText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal, 36)
                .padding(.top, 30)
                .padding(.bottom, 24)
            }
        }
        .background(ITDAUI.background)
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 17, weight: .bold))
            .foregroundStyle(ITDAUI.text)
    }
}

struct ITDAProjectView: View {
    var body: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "Project")

            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    HStack(spacing: 14) {
                        Image("프로필 사진")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 58, height: 58)
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 6) {
                            Text("메타몽")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(ITDAUI.text)

                            Text("SW개발과 · 1학년\n기업용 2025년 1월")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(ITDAUI.subText)
                                .lineSpacing(2)
                        }
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("기술 스택")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundStyle(ITDAUI.text)

                        HStack(spacing: 8) {
                            ITDAChip(title: "Back-end")
                            ITDAChip(title: "Java")
                            ITDAChip(title: "JavaScript")
                            ITDAChip(title: "Design")
                        }
                    }

                    ITDAInfoBox(title: "경력", value: "")
                    ITDAInfoBox(title: "자기소개", value: "")
                    ITDAProjectStatsCard(items: [("참여 프로젝트", "2"), ("지원 내역", "3"), ("완료 예정", "1")])

                    HStack(spacing: 10) {
                        ITDAOutlineButton(title: "프로젝트 전체 보기") {}
                        ITDAOutlineButton(title: "설정") {}
                    }
                }
                .padding(.horizontal, 36)
                .padding(.top, 30)
                .padding(.bottom, 28)
            }
        }
        .background(ITDAUI.background)
    }
}

struct ITDANotificationView: View {
    @State private var projectAlert = true
    @State private var deadlineAlert = true
    @State private var resultAlert = true

    var body: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "알림", showsBackButton: true, trailingTitle: "전체 읽음 처리")

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    ITDASelectField(title: "알림 유형", value: "전체") {}

                    ForEach(sampleProjects, id: \.title) { project in
                        ITDANotificationCard(project: project)
                    }

                    sectionHeader("알림설정")

                    VStack(spacing: 0) {
                        ITDASettingToggleRow(title: "새 프로젝트 알림", isOn: $projectAlert)
                        ITDASettingToggleRow(title: "프로젝트 마감 알림", isOn: $deadlineAlert)
                        ITDASettingToggleRow(title: "프로젝트 지원 결과 알림", isOn: $resultAlert, showsDivider: false)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(ITDAUI.border, lineWidth: 1)
                    }
                }
                .padding(.horizontal, 36)
                .padding(.top, 28)
                .padding(.bottom, 28)
            }
        }
        .background(ITDAUI.background)
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 17, weight: .bold))
            .foregroundStyle(ITDAUI.text)
            .padding(.top, 8)
    }
}

struct ITDAProfileView: View {
    @State private var showSignOut = false

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                ITDAProfileHeader()

                HStack {
                    Button {} label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(ITDAUI.text)
                            .frame(width: 36, height: 36)
                            .background(.white.opacity(0.90))
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 6)
                    }
                    .buttonStyle(.plain)

                    Spacer()

                    HStack(spacing: 14) {
                        Image("bell")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(ITDAUI.text)
                            .frame(width: 18, height: 18)

                        Image("setting")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(ITDAUI.text)
                            .frame(width: 18, height: 18)
                    }
                }
                .padding(.horizontal, 22)
                .padding(.top, 58)
            }

            VStack(spacing: 0) {
                ITDAMenuRow(title: "개인 정보")
                ITDAMenuRow(title: "현재 참여 중인 프로젝트")
                ITDAMenuRow(title: "자기소개")
                ITDAMenuRow(title: "알림 설정")
                ITDAMenuRow(title: "버전 정보")
                ITDAMenuRow(title: "로그아웃") {
                    showSignOut = true
                }
            }
            .padding(.top, 14)

            Spacer()
        }
        .background(.white)
        .overlay {
            if showSignOut {
                Color.black.opacity(0.18)
                    .ignoresSafeArea()

                ITDAPopup(
                    title: "Are you sure?",
                    message: "This will only sign you out of IT-DA.\nAre you really going to walk out?",
                    onCancel: { showSignOut = false },
                    onConfirm: { showSignOut = false }
                )
            }
        }
    }
}

struct ITDATeamCreateView: View {
    @State private var projectName = ""
    @State private var goal = ""
    @State private var requiredSkill = ""

    var body: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "Team create", showsBackButton: true)

            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    Text("새 프로젝트 등록")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(ITDAUI.text)

                    Text("기본 정보")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(ITDAUI.subText)

                    ITDATextField(title: "프로젝트 이름", placeholder: "", text: $projectName)
                    ITDASelectField(title: "카테고리", value: "선택") {}
                    ITDASelectField(title: "진행 기간", value: "2개월 이내") {}
                    ITDATextField(title: "진행 방식", placeholder: "온라인", text: .constant(""))

                    Text("설명 및 목표")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(ITDAUI.subText)

                    ITDALargeTextBox(title: "프로젝트 이름", placeholder: "프로젝트 소개", text: $projectName)
                    ITDALargeTextBox(title: "목표 및 기대 결과", placeholder: "목표 및 기대 결과", text: $goal)

                    Text("설정 및 목표")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(ITDAUI.subText)

                    ITDASelectField(title: "모집 인원", value: "1명") {}
                    ITDASelectField(title: "모집 역할", value: "프론트엔드") {}
                    ITDATextField(title: "필요 기술 스택", placeholder: "", text: $requiredSkill)
                    ITDATextField(title: "지원 마감일", placeholder: "", text: .constant(""))
                }
                .padding(.horizontal, 36)
                .padding(.top, 30)
                .padding(.bottom, 34)
            }
        }
        .background(.white)
    }
}

struct ITDAProjectDetailView: View {
    var isManager = false

    var body: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "Project")

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("AI기반 학습 플래너 [야무야]")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(ITDAUI.text)
                        Spacer()
                        ITDABadge(title: "모집 중")
                        ITDABadge(title: "4일 전")
                    }

                    ITDAApplicantRow()
                    ITDAInfoBox(title: "프로젝트 소개", value: "목표는 인공지능입니다 · 디자인 · 프론트")
                    ITDADetailInfoCard()
                    ITDATeamMemberCard()
                    ITDAProjectStatsCard(items: [("지원 현황", "12"), ("진행 중", "3"), ("완료 예정", "2")])

                    if isManager {
                        ITDAPrimaryButton(title: "진행 상황 및 보고서 작성") {}
                        ITDAOutlineButton(title: "팀 관리") {}
                    }
                }
                .padding(.horizontal, 36)
                .padding(.top, 30)
                .padding(.bottom, 32)
            }
        }
        .background(.white)
    }
}

struct ITDAProfileEditView: View {
    @State private var name = ""
    @State private var github = ""
    @State private var skill = ""
    @State private var school = ""

    var body: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "개인 정보", showsBackButton: true)

            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    ITDATextField(title: "이름", placeholder: "예: 올름곰", text: $name)
                    ITDATextField(title: "Github", placeholder: "m0olg", text: $github)
                    ITDASelectField(title: "학급", value: "1 - 3") {}
                    ITDASelectField(title: "전공", value: "iOS") {}
                    ITDASelectField(title: "관심 분야", value: "Back-end") {}
                    ITDATextField(title: "기술 스택", placeholder: "예: Python, Figma, Swift", text: $skill)
                    ITDATextField(title: "학교 / 소속", placeholder: "광주소프트웨어마이스터고등학교", text: $school)
                }
                .padding(.horizontal, 36)
                .padding(.top, 30)
                .padding(.bottom, 32)
            }
        }
        .background(.white)
    }
}

struct ITDAAlertSettingsView: View {
    @State private var newProject = true
    @State private var deadline = true
    @State private var result = true
    @State private var teamInvite = true
    @State private var comment = false
    @State private var role = false
    @State private var message = true
    @State private var mention = true

    var body: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "알림설정", showsBackButton: true)

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    settingSection("프로젝트 알림") {
                        ITDASettingToggleRow(title: "새 프로젝트 알림", isOn: $newProject)
                        ITDASettingToggleRow(title: "프로젝트 마감 알림", isOn: $deadline)
                        ITDASettingToggleRow(title: "프로젝트 지원 결과 알림", isOn: $result, showsDivider: false)
                    }

                    settingSection("협업 알림") {
                        ITDASettingToggleRow(title: "팀원 초대 알림", isOn: $teamInvite)
                        ITDASettingToggleRow(title: "댓글 / 답글 알림", isOn: $comment)
                        ITDASettingToggleRow(title: "역할 배정 알림", isOn: $role, showsDivider: false)
                    }

                    settingSection("메시지 알림") {
                        ITDASettingToggleRow(title: "프로젝트 채팅 알림", isOn: $message)
                        ITDASettingToggleRow(title: "멘션 알림", isOn: $mention, showsDivider: false)
                    }
                }
                .padding(.horizontal, 36)
                .padding(.top, 30)
                .padding(.bottom, 32)
            }
        }
        .background(.white)
    }

    private func settingSection<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(ITDAUI.text)

            VStack(spacing: 0) {
                content()
            }
        }
    }
}

struct ITDAVersionInfoView: View {
    var body: some View {
        VStack(spacing: 0) {
            ITDANavigationBar(title: "버전 정보", showsBackButton: true)

            Spacer()

            VStack(spacing: 12) {
                Image("vertion")
                    .resizable()
                    .frame(width: 24, height: 24)

                Text("현재 버전은 v1 입니다")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(ITDAUI.text)
            }

            Spacer()
        }
        .background(.white)
    }
}

private struct ITDAProfileSummary: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image("프로필 사진(s)")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text("안녕하세요, OOO님")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(ITDAUI.text)
                    Text("👋")
                        .font(.system(size: 14))
                }

                Text("상용디자이너입니다.\n활동 프로젝트를 확인해 보세요.")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(ITDAUI.subText)
                    .lineSpacing(2)
            }

            Spacer()
        }
    }
}

private struct ITDAProjectStatsCard: View {
    let items: [(String, String)]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                VStack(spacing: 9) {
                    Text(item.0)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(ITDAUI.subText)

                    Text(item.1)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(ITDAUI.text)
                }
                .frame(maxWidth: .infinity)

                if index < items.count - 1 {
                    Rectangle()
                        .fill(ITDAUI.lightBorder)
                        .frame(width: 1, height: 42)
                }
            }
        }
        .padding(.vertical, 18)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 9)
                .stroke(ITDAUI.border, lineWidth: 1)
        }
        .shadow(color: .black.opacity(0.08), radius: 9, x: 0, y: 4)
    }
}

private struct ITDANotificationRow: View {
    let notification: ITDANotification

    var body: some View {
        HStack(spacing: 13) {
            Image(notification.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 34, height: 34)

            VStack(alignment: .leading, spacing: 4) {
                Text(notification.title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(ITDAUI.text)
                    .lineLimit(1)

                Text(notification.date)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(ITDAUI.subText)
            }

            Spacer()
        }
        .padding(.horizontal, 14)
        .frame(height: 58)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 9)
                .stroke(ITDAUI.border, lineWidth: 1)
        }
    }
}

private struct ITDANotificationCard: View {
    let project: ITDAProject

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text(project.title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(ITDAUI.text)
                Spacer()
                ITDABadge(title: project.status)
            }

            Text(project.subtitle)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(ITDAUI.subText)

            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundStyle(Color(red: 0.45, green: 0.66, blue: 1.00))
                Text("읽기 전")
                Spacer()
                Text("1시간 전")
            }
            .font(.system(size: 11, weight: .medium))
            .foregroundStyle(ITDAUI.subText)
        }
        .padding(16)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 9)
                .stroke(ITDAUI.border, lineWidth: 1)
        }
    }
}

private struct ITDAProfileHeader: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack(spacing: 0) {
                LinearGradient(
                    colors: [
                        Color(red: 0.60, green: 0.68, blue: 1.00),
                        Color(red: 0.89, green: 0.46, blue: 0.72)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .frame(height: 236)
                .clipShape(ProfileWaveShape())

                Spacer(minLength: 0)
            }

            HStack(alignment: .center, spacing: 16) {
                Image("프로필 사진")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 82)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 7) {
                    Text("울릉곰 님")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundStyle(ITDAUI.text)

                    Text("@Github: m0olg")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(ITDAUI.subText)

                    Text("학급: 1-3 | 전공: iOS")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(ITDAUI.subText)
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 36)
        }
        .frame(height: 288)
    }
}

private struct ProfileWaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.height * 0.74))
        path.addCurve(
            to: CGPoint(x: 0, y: rect.height * 0.72),
            control1: CGPoint(x: rect.width * 0.72, y: rect.height * 1.02),
            control2: CGPoint(x: rect.width * 0.32, y: rect.height * 0.54)
        )
        path.closeSubpath()
        return path
    }
}

private struct ITDAMenuRow: View {
    let title: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(ITDAUI.text)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(ITDAUI.subText)
            }
            .padding(.horizontal, 36)
            .frame(height: 52)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

private struct ITDAInfoBox: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(ITDAUI.text)

            Text(value.isEmpty ? " " : value)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(ITDAUI.subText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 66, alignment: .topLeading)
                .padding(12)
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(ITDAUI.fieldBorder, lineWidth: 1)
                }
        }
    }
}

private struct ITDALargeTextBox: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(ITDAUI.text)

            TextEditor(text: $text)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(ITDAUI.text)
                .frame(height: 88)
                .padding(8)
                .overlay(alignment: .topLeading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(ITDAUI.subText.opacity(0.65))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 16)
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(ITDAUI.fieldBorder, lineWidth: 1)
                }
        }
    }
}

private struct ITDAOutlineButton: View {
    let title: String
    var action: () -> Void

    var body: some View {
        Button(title, action: action)
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(ITDAUI.subText)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 9)
                    .stroke(ITDAUI.border, lineWidth: 1)
            }
            .buttonStyle(.plain)
    }
}

private struct ITDASettingToggleRow: View {
    let title: String
    @Binding var isOn: Bool
    var showsDivider = true

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(ITDAUI.text)

                Spacer()

                ITDASwitch(isOn: $isOn)
            }
            .frame(height: 44)

            if showsDivider {
                Rectangle()
                    .fill(ITDAUI.lightBorder)
                    .frame(height: 1)
            }
        }
    }
}

private struct ITDAApplicantRow: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("프로필 사진(s)")
                .resizable()
                .scaledToFill()
                .frame(width: 34, height: 34)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text("메타몽 · IoT과 1학년")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(ITDAUI.text)
                Text("팀장")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(ITDAUI.subText)
            }

            Spacer()
        }
        .padding(.horizontal, 12)
        .frame(height: 54)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 9)
                .stroke(ITDAUI.border, lineWidth: 1)
        }
    }
}

private struct ITDADetailInfoCard: View {
    var body: some View {
        VStack(spacing: 11) {
            info("모집 역할", "백엔드")
            info("기술 스택", "JavaScript, Java")
            info("활동 기간", "2026년 5월 6일 ~ 6월 28일")
            info("활동 방식", "주 2회 대면 · 온라인 병행")
            info("모집 인원", "2명 추가 모집")
        }
        .padding(16)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 9)
                .stroke(ITDAUI.border, lineWidth: 1)
        }
    }

    private func info(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(ITDAUI.text)
            Spacer()
            Text(value)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(ITDAUI.subText)
        }
    }
}

private struct ITDATeamMemberCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("팀 구성")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(ITDAUI.text)

            ForEach(["이시우 · 수피너디 1학년", "이동혁 · 사피너디 1학년", "박지아 · 인공지능사관 1학년"], id: \.self) { name in
                HStack(spacing: 10) {
                    Image("프로필 사진(s)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 2) {
                        Text(name)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(ITDAUI.text)
                        Text("iOS 개발")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundStyle(ITDAUI.subText)
                    }
                    Spacer()
                }
            }
        }
        .padding(16)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 9)
                .stroke(ITDAUI.border, lineWidth: 1)
        }
    }
}

struct ITDAScreens_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ITDAHomeView()
                .frame(width: 393, height: 852)
            ITDAProjectView()
                .frame(width: 393, height: 852)
            ITDANotificationView()
                .frame(width: 393, height: 852)
            ITDAProfileView()
                .frame(width: 393, height: 852)
        }
    }
}
