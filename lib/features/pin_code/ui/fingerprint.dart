part of 'pin_code.dart';

class FingerprintAuth extends StatelessWidget {
  const FingerprintAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: SizedBox(
        height: 100,
        width: 80,
        child: GestureDetector(
          onTap: () {
            context.read<PinCodeCubit>().fingerprint();
          },
          child: Container(
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(1.00, -0.01),
                end: Alignment(-1, 0.01),
                colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Icon(
              Icons.fingerprint,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
