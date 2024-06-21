# 2024-NC2-A11-CoreMotion
## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## 💡 About CoreMotion
**CoreMotion** 이란 애플 기기에서 사용할 수 있는 다양한 센서를 통해 움직임 및 환경 관련 데이터를 수집하고 처리하는 데 활용되는 Apple의 Framework
- Accelerometer
  - 기기의 움직임 감지
  - 기기마다 있는 3축 센서를 통해 기기가 어떤 방향으로 얼마나 빠르게 움직이는지 측정
- Pedometer
  - 사용자의 걸음 수 측정
  - 기기가 측정한 걸음 수, 이동 거리, 오르거나 내려온 층 수에 대한 정보를 가져올 수 있음
- Gyroscope
  - 기기가 공간 축을 중심으로 회전하는 속도를 측정
  - 3개 축 각각의 회전 값을 전달하는, 3축 자이로스코프가 있음
  - 회전 값은 지정된 축을 중심으로 초당 라디안 단위로 측정
- Environmental-Related-Events
  - 주변 환경 변화와 관련된 센서 데이터를 처리
  - 현재 활동 상태, 기압, 수압, 넘어짐 감지, 빠짐 감지 등 여러 센서 데이터 제공

## 🎯 What we focus on?
- WatchOS
- CMPedometer
  - `currentPace, currentCadence, distance`
- WatchKit
  - `WKHapticType, WKInterfaceDevice`

## 💼 Use Case
사전 설정한 목표 페이스를 미달/초과할 경우 진동으로 알림을 줘 페이스 유지에 도움을 준다.

## 🖼️ Prototype
<img width="955" alt="스크린샷 2024-06-20 오후 5 33 29" src="https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A11-CoreMotion/assets/124751277/a29cba0e-648e-4053-9892-891e53520c2b">
<img width="956" alt="스크린샷 2024-06-20 오후 5 33 36" src="https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A11-CoreMotion/assets/124751277/1dae53af-5dea-41e3-a412-edf5f3045f33">

## 🛠️ About Code
<img width="958" alt="스크린샷 2024-06-21 오전 11 15 44" src="https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A11-CoreMotion/assets/124751277/7909b09c-56e0-4c97-b965-7bde4831b9e8">

