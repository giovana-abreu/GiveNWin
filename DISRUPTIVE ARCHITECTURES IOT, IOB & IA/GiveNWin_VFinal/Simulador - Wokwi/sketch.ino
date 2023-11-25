#include <WiFi.h>
#include <WiFiClient.h>
#include <PubSubClient.h>
#include <Adafruit_ILI9341.h>
#include <Adafruit_GFX.h>

#define WIFI_SSID "Wokwi-GUEST"
#define WIFI_PASSWORD ""
#define WIFI_CHANNEL 1
int status = WL_IDLE_STATUS;

const char* mqtt_server = "test.mosquitto.org";
char* topic = "topic";

WiFiClient espClient;
PubSubClient client(espClient);

int PIR_SENSOR_PIN = 22;
int PIR_SENSOR_STATUS = 0;
int previousStatus = -1;
unsigned long lastChangeTime = 0;

int contador = 1;
char mensagem[30];
unsigned long lastMillis = 0;

int ledAmarelo = 13;
int ledVerde = 5;

#define TFT_CS 15
#define TFT_DC 2

Adafruit_ILI9341 tft = Adafruit_ILI9341(TFT_CS, TFT_DC);

void setup() {
  Serial.begin(115200);
  pinMode(PIR_SENSOR_PIN, INPUT);
  pinMode(ledAmarelo, OUTPUT);
  pinMode(ledVerde, OUTPUT);
  conectawifi();

  client.setServer(mqtt_server, 1883);

  tft.begin();
  tft.setRotation(1);
}

void loop() {
  PIR_SENSOR_STATUS = digitalRead(PIR_SENSOR_PIN);

  if (PIR_SENSOR_STATUS != previousStatus) {
    tft.fillScreen(ILI9341_BLACK);
  tft.setCursor(10, 10);
  tft.setTextSize(2);
  tft.setTextColor(ILI9341_WHITE);
  tft.print("Quer ganhar pontos extras? Escaneie o QR Code no seu app: ");
  Serial.println("Quer ganhar pontos extras? Escaneie o QR Code no seu app: ");

    previousStatus = PIR_SENSOR_STATUS;

    if (PIR_SENSOR_STATUS != 0) {
      // PIR sensor activated
      String movimento = Sensor_movimento();

      // Attempt to connect to the MQTT broker until the message is successfully published
      bool messagePublished = false;
      while (!messagePublished) {
        if (!client.connected()) {
          reconnect();
        }

        client.loop();
        delay(1000);

        if (millis() - lastMillis > 15000) {
          lastMillis = millis();
          Serial.print("CPF Recebido: ");
          Serial.println(movimento);

          // Envia a mensagem ao broker
          if (client.publish(topic, movimento.c_str())) {
            messagePublished = true;
            Serial.print(contador);
            Serial.println("- CPF recebido com sucesso!");  
            digitalWrite(ledVerde, HIGH);
            delay(3000);
            digitalWrite(ledVerde, LOW);

            // Display on ILI9341
            tft.fillScreen(ILI9341_BLACK);
            tft.setCursor(10, 10);
            tft.setTextSize(2);
            tft.setTextColor(ILI9341_WHITE);
            tft.print("Operação Concluída!");
            delay(1000);
            tft.setCursor(10, 40);
            tft.print(movimento);
          } else {
            Serial.println("Falha ao publicar mensagem. Tentando novamente...");
          }
        }
      }
    }
  }
}

String Sensor_movimento() {
  Serial.println("Lendo informações...");
  digitalWrite(ledAmarelo, HIGH);
  // Wait for input in the Serial monitor
  Serial.println("Digite o CPF escaneado:");
  while (!Serial.available()) {
    delay(100);
  }
  String customMessage = Serial.readStringUntil('\n');
  Serial.print("CPF: ");
  Serial.println(customMessage);
  digitalWrite(ledAmarelo, LOW);
  return customMessage;
}

void conectawifi() {
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD, WIFI_CHANNEL);
  Serial.print("Conectando ao WiFi ");
  Serial.print(WIFI_SSID);
  while (WiFi.status() != WL_CONNECTED) {
    delay(100);
    Serial.print(".");
  }
  Serial.println(" Conectado!");

  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

void reconnect() {
  while (!client.connected()) {
    Serial.print("Tentando conectar ao MQTT ...");
    if (client.connect("ESPClient")) {
      Serial.println("Conectado");
      client.subscribe(topic);
    } else {
      Serial.print("Falha ");
      Serial.print(client.state());
      Serial.println(" Tente novamente em 5 segundos");
      delay(5000);
    }
  }
}