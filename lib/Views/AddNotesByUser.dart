import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../Constents/AppConstents.dart';
import '../Constents/AppStyles.dart';
import '../Utility/ModuleEnum.dart';
import '../Models/UserModels.dart';
import '../ViewModels/CalenderViewModels.dart';
import '../ViewModels/DarkModeViewModels.dart';
import '../ViewModels/NotesUploadsViewsModels/NoteUploadViewModels.dart';
import '../Widgets/BottonBar/BottomBar.dart';
import '../Widgets/Buttons/BackWidgets.dart';
import '../Widgets/Buttons/ButtonWidgets.dart';
import '../Widgets/CalenderWidgets/CalenderFace.dart';
import '../Widgets/NarrowContainer.dart';
import 'UserUpdateProfile.dart';

class UploadNoteScreen extends StatelessWidget {
  final UserModel user;
  final NoteUploadController c = Get.put(NoteUploadController());
  final CalendarController controller = Get.put(CalendarController());
  final LightModeController lightModeController = Get.find<LightModeController>();

  UploadNoteScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: lightModeController.isLightMode.value ? Colors.black : Colors.white,
        leading: BackWidget(
          onTap: () {},
          imagePath: lightModeController.isLightMode.value
              ? AppConstants.backWhiteIcon
              : AppConstants.backBlackIcon,
        ),
        title: Text(
          AppConstants.noteSwapTexts,
          style: AppStyles.textStyleLargeBold,
        ),
        centerTitle: true,
        actions: [
          BackWidget(
            onTap: () {
              Get.to(AddUsers());
            },
            imagePath: lightModeController.isLightMode.value
                ? AppConstants.whiteSettingIcon
                : AppConstants.blackSettingIcon,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NarrowContainer(isLightMode: lightModeController.isLightMode.value),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  TextField(
                    controller: c.titleController,
                    decoration: const InputDecoration(labelText: "Title"),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: c.courseCodeController,
                    decoration: const InputDecoration(labelText: "Course Code"),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: c.courseNameController,
                    decoration: const InputDecoration(labelText: "Course Name"),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: c.subjectController,
                    decoration: const InputDecoration(labelText: 'Subject'),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<ModuleName>(
                        value: c.selectedModule.value,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: ModuleName.values
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ))
                            .toList(),
                        onChanged: (v) => c.selectedModule.value = v!,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Upload Preview of Notes",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Container(
                      width: 450,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 8)
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Upload your files",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => c.pickFile(user),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 4)
                                ],
                              ),
                              child: Column(
                                children: [
                                  const Icon(Icons.folder, size: 50, color: Colors.amber),
                                  const SizedBox(height: 10),
                                  Text(
                                    c.fileName.value.isEmpty
                                        ? "Drag and drop your files here"
                                        : c.fileName.value,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    "My upLoad",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (c.fileName.value.isNotEmpty)
                                  Expanded(
                                    flex: 5,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.white24,
                                      color: Colors.blue,
                                      minHeight: 5,
                                      value: c.uploadProgress.value,
                                    ),
                                  ),
                                IconButton(
                                  icon: const Icon(Icons.refresh,
                                      color: Colors.white),
                                  onPressed: () => c.pickFile(user),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Kindly Update the Date of Exam",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  CalenderScreen(controller: controller),
                  const SizedBox(height: 12),
                  const Text("Set Price"),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.black,
                      inactiveTrackColor: Colors.black54,
                      thumbColor: Colors.black,
                      overlayColor: Colors.black.withAlpha(32),
                      valueIndicatorColor: Colors.purpleAccent,
                    ),
                    child: Slider(
                      value: c.modulePrice.value,
                      min: 0,
                      max: 150,
                      divisions: 150,
                      label: "₹${c.modulePrice.value.toInt()}",
                      onChanged: (val) => c.modulePrice.value = val,
                    ),
                  ),
                  Text("Price: ₹${c.modulePrice.value.toInt()}"),
                  const SizedBox(height: 12),
                  // Display added modules
                  const SizedBox(height: 24),
                  ButtonWidgets(
                    onTap: () => c.addModuleAndUploadNote(user),
                    buttonText: 'Post Offer',
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
