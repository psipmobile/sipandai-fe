import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:samsat_gpt/core.dart';
import 'package:samsat_gpt/module/chat/widget/container_rekomendasi.dart';
import 'package:samsat_gpt/module/chat/widget/slider_view.dart';
import 'package:samsat_gpt/shared/widgets/app_bar/switch_drawer.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  Widget build(context, ChatController controller) {
    controller.view = this;

    double screenHeight = View.of(context).physicalSize.height /
        View.of(context).devicePixelRatio;

    final GlobalKey<SliderDrawerState> sliderDrawerKey =
        GlobalKey<SliderDrawerState>();

    return Scaffold(
      body: SafeArea(
        child: SliderDrawer(
          key: sliderDrawerKey,
          animationDuration: 0,
          appBar: SliderAppBar(
            appBarColor: Theme.of(context).colorScheme.surface,
            title: Container(),
            drawerIcon: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SwitchDrawerWidget(
                sliderDrawerKey: sliderDrawerKey,
              ),
            ),
            trailing: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: SwitchThemeWidget(
                    sliderDrawerKey: sliderDrawerKey,
                  ),
                ),
                const ContainerWidth(),
              ],
            ),
          ),
          slider: const SliderView(),
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: screenHeight - 100,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Spacer(),
                                  SvgPicture.asset(
                                    isDarkMode(context)
                                        ? "images/logo/sipandai_circle_dark.svg"
                                        : "images/logo/sipandai_circle.svg",
                                    height: 100,
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  SvgPicture.asset(
                                    isDarkMode(context)
                                        ? "images/logo/sipandai_text.svg"
                                        : "images/logo/sipandai_text_dark.svg",
                                    height: 45,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "Membantu anda memberikan informasi mengenai Pajak kendaraan",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                        ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            BaseCenter(
                              child: Column(
                                children: [
                                  Text(
                                    "Apa yang bisa kami bantu hari ini?",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  const BaseForm(
                                    prefixIcon: "icons/input/mic.svg",
                                    hintText: "Tulis pertanyaan kamu disini...",
                                  ),
                                  const SizedBox(
                                    height: 32.0,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "icons/misc/book_4_spark.svg",
                                        colorFilter: colorFilterGreen700,
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      Text(
                                        "Rekomendasi untuk kamu",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  ScreenTypeLayout.builder(
                                    desktop: (context) {
                                      return _rekomendasiWidget(false);
                                    },
                                    mobile: (context) {
                                      return _rekomendasiWidget(true);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const ContainerWidth(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rekomendasiWidget(bool isMobile) {
    if (isMobile) {
      return const Column(
        children: [
          ContainerRekomendasi(
            title: "Hitung Biaya PKB",
            subtitle: "Membantu kamu untuk menghitung Pajak Kendaraan Anda ",
          ),
          SizedBox(
            height: 16.0,
          ),
          ContainerRekomendasi(
            title: "Hitung Biaya BBNKB I",
            subtitle:
                "Membantu kamu untuk menghitung biaya BBNKB kendaraan baru",
          ),
          SizedBox(
            height: 16.0,
          ),
          ContainerRekomendasi(
            title: "Hitung Biaya BBNKB II",
            subtitle:
                "Membantu kamu untuk menghitung biaya BBNKB kendaraan bekas",
          ),
        ],
      );
    } else {
      return const Row(
        children: [
          Expanded(
            child: ContainerRekomendasi(
              title: "Hitung Biaya PKB",
              subtitle: "Membantu kamu untuk menghitung Pajak Kendaraan Anda ",
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: ContainerRekomendasi(
              title: "Hitung Biaya BBNKB I",
              subtitle:
                  "Membantu kamu untuk menghitung biaya BBNKB kendaraan baru",
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: ContainerRekomendasi(
              title: "Hitung Biaya BBNKB II",
              subtitle:
                  "Membantu kamu untuk menghitung biaya BBNKB kendaraan bekas",
            ),
          ),
        ],
      );
    }
  }

  @override
  State<ChatView> createState() => ChatController();
}

class ContainerWidth extends StatefulWidget {
  const ContainerWidth({super.key});

  @override
  State<ContainerWidth> createState() => _ContainerWidthState();
}

class _ContainerWidthState extends State<ContainerWidth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.watch<ThemeBloc>().state.isDrawerExpanded ? 260 : 0,
    );
  }
}
