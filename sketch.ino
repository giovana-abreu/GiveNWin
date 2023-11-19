#include <Keypad.h>
#include <Adafruit_GFX.h>
#include <Adafruit_ILI9341.h>

#define TFT_DC 2
#define TFT_CS 15

const int lin = 4;
const int cols = 4;
char keys[lin][cols] = {
  {'1', '2', '3', 'A'},
  {'4', '5', '6', 'B'},
  {'7', '8', '9', 'C'},
  {'*', '0', '#', 'D'}
};

uint8_t coluna[cols] = {27, 13, 12, 3};
uint8_t linha[lin] = {33, 25, 26, 14};

Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC);

Keypad keypad = Keypad(makeKeymap(keys), linha, coluna, lin, cols);

char numDigitados[11];
int cont = 0;
bool confirmed = false;

void setup() {
  tft.begin();
  tft.setRotation(1);
}

void loop() {
  tft.fillScreen(ILI9341_BLACK);
  tft.setCursor(10, 10);
  tft.setTextSize(2);
  tft.setTextColor(ILI9341_WHITE);
  tft.print("Quer ganhar pontos extras? Insira aqui seu CPF: ");

  while (cont < 11) {
    char key = keypad.getKey();
    if (key != NO_KEY) {
      numDigitados[cont] = key;
      cont++;

      // Display typed numbers on the screen after 11 numbers are entered
      if (cont == 11) {
        tft.fillScreen(ILI9341_BLACK);
        tft.setCursor(10, 10);
        tft.setTextSize(2);
        tft.setTextColor(ILI9341_WHITE);
        tft.print("Confirma o CPF digitado?  ");
        tft.setCursor(10, 30);
        tft.print(numDigitados);

        tft.setCursor(10, 60);
        tft.print("Digite 1 para SIM, 0 para NAO");
      }
    }
  }

  while (true) {
    char confirmation = keypad.getKey();
    if (confirmation == '1') {
      tft.fillScreen(ILI9341_BLACK);  // Clear the screen
      tft.setCursor(10, 10);
      tft.setTextSize(2);
      tft.setTextColor(ILI9341_WHITE);
      tft.print("CPF confirmado! Seus pontos serao adicionados automaticamente a sua conta! ");
      
      confirmed = true;
      delay(5000);
      break;
    } else if (confirmation == '0') {
      tft.fillScreen(ILI9341_BLACK);  // Clear the screen
      tft.setCursor(10, 10);
      tft.setTextSize(2);
      tft.setTextColor(ILI9341_WHITE);
      tft.print("Operacao Cancelada");
      delay(2000);
      break;
    }
  }

  cont = 0;

  if (confirmed) {
    confirmed = false; // Reset the confirmation flag
    // Use 'numDigitados' or any other variable as needed
    // ... (add your code to send the confirmed number to Node-RED)
  }
}
