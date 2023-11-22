#include <Adafruit_ILI9341.h>
#include <Adafruit_GFX.h>

int led = 13; 
int sensor = 22;
int statusSensor = LOW;
int value = 0;

#define TFT_CS 15
#define TFT_DC 2

Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC);

void setup() {
  pinMode(led, OUTPUT);
  pinMode(sensor, INPUT);

  Serial.begin(9600);

  tft.begin();
  tft.setRotation(1);
}

void loop() {
  tft.fillScreen(ILI9341_BLACK);
  tft.setCursor(10, 10);
  tft.setTextSize(2);
  tft.setTextColor(ILI9341_WHITE);
  tft.print("Quer ganhar pontos extras? Escaneie o QR Code no seu app: ");

  while (true) {
    value = digitalRead(sensor);

    if (value == HIGH) {
      if (statusSensor == LOW) {
        Serial.println("Lendo informações...");

        Serial.print("CPF do cliente: ");
        while (Serial.available() == 0) {
          delay(10);
        }
        int cpfCliente = Serial.parseInt();

        displayCPF(cpfCliente);

        statusSensor = HIGH;
        break;
      }
    } else {
      digitalWrite(led, LOW);
      if (statusSensor == HIGH) {
        Serial.println("Operação Concluída!");
        tft.fillScreen(ILI9341_BLACK);
        statusSensor = LOW;
        break;
      }
    }
  }
}

void displayCPF(int cpfCliente) {
  tft.fillScreen(ILI9341_BLACK);
  tft.setTextSize(2);
  tft.setTextColor(ILI9341_WHITE);
  tft.setCursor(10, 40);
  digitalWrite(led, HIGH);
  tft.print("CPF confirmado! Seus pontos serão adicionados automaticamente à conta associada a esse CPF ");
  tft.setCursor(10, 70);
  delay(5000);
  tft.fillScreen(ILI9341_BLACK);
}