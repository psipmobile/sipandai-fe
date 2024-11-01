import 'package:flutter/material.dart';
import 'package:samsat_gpt/core.dart';
import 'package:samsat_gpt/module/chat/widget/container_rekomendasi_drawer.dart';

class SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const SliderView({super.key, this.onItemClick});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter.of(context);
    final String currentRoute =
        router.routerDelegate.currentConfiguration.uri.toString();

    bool isParentSelected(String parentRoute, List<String> childRoutes) {
      return currentRoute == parentRoute ||
          childRoutes.any((route) => currentRoute.startsWith(route));
    }

    double screenHeight = View.of(context).physicalSize.height /
        View.of(context).devicePixelRatio;

    return Container(
      decoration: BoxDecoration(
        border: Border(
            right: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        )),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: const EdgeInsets.all(
        16,
      ),
      child: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight - 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Datang, di",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "SamsatGPT",
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              BaseSecondaryButton(
                prefixIcon: "icons/misc/chat_add_on.svg",
                text: "Ayo Ngobrol",
                onPressed: () {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(
                height: 16.0,
              ),
              ContainerRekomendasiDrawer(
                prefixIcon: 'icons/fitur/pkb.svg',
                onPressed: () {},
                text: 'Hitung PKB',
              ),
              const SizedBox(
                height: 8.0,
              ),
              ContainerRekomendasiDrawer(
                prefixIcon: 'icons/fitur/bbn1.svg',
                onPressed: () {},
                text: 'Hitung BBNKB I',
              ),
              const SizedBox(
                height: 8.0,
              ),
              ContainerRekomendasiDrawer(
                prefixIcon: 'icons/fitur/bbn2.svg',
                onPressed: () {},
                text: 'Hitung BBNKB II',
              ),
              const SizedBox(
                height: 16.0,
              ),
              Divider(
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  physics: const ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hari Ini",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                " Hitung BBNKB 2 untuk Nopol F-1234-ABC",
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        "Kemarin",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                " berapa biaya opsen untuk kendaraan",
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
