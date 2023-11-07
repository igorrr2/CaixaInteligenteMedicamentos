#include <arduino.h>
#include <WiFi.h>
#include <PubSubClient.h>
#include <ESP32Servo.h>  //Biblioteca utilizada

int recipiente1 = 32;
int recipiente2 = 33;
int recipiente3 = 34;
int recipiente4 = 35;

int ledRecipiente1 = 18;
int ledRecipiente2 = 19;
int ledRecipiente3 = 21;
int ledRecipiente4 = 22;

int valorRecipiente1 = 0;
int valorRecipiente2 = 0;
int valorRecipiente3 = 0;
int valorRecipiente4 = 0;

bool recipiente1Ativo = false;
bool recipiente2Ativo = false;
bool recipiente3Ativo = false;
bool recipiente4Ativo = false;

const int buzzer = 18;

////////////////////////////////////////////////////////////////////////////////////////////////////////
/* Definicoes para o MQTT */
#define TOPICO_SUBSCRIBE_MED_BOX_SMART "TOPICO_SUBSCRIBE_MED_BOX_SMART"
#define TOPICO_PUBLISH_MED_BOX_SMART "TOPICO_PUBLISH_MED_BOX_SMART"
#define ID_MQTT  "dc44fae4-a83f-4303-9e8c-44957228882c"     //id mqtt (para identificação de sessão)
//#define ID_MQTT  "mqttdash-ea4e25ea"
////////////////////////////////////////////////////////////////////////////////////////////////////////

const char* SSID     = "igor"; // SSID / nome da rede WI-FI que deseja se conectar
const char* PASSWORD = "123456ie"; // Senha da rede WI-FI que deseja se conectar

const char* BROKER_MQTT = "test.mosquitto.org";
int BROKER_PORT = 1883; // Porta do Broker MQTT

//Variáveis e objetos globais
WiFiClient espClient; // Cria o objeto espClient
PubSubClient MQTT(espClient); // Instancia o Cliente MQTT passando o objeto espClient


/* Prototypes */
void initWiFi(void);
void initMQTT(void);
void mqtt_callback(char* topic, byte* payload, unsigned int length);
void reconnectMQTT(void);
void reconnectWiFi(void);
void VerificaConexoesWiFIEMQTT(void);

/*
   Implementações
*/

/* Função: inicializa e conecta-se na rede WI-FI desejada
   Parâmetros: nenhum
   Retorno: nenhum
*/
void initWiFi(void)
{
  delay(10);
  Serial.println("------Conexao WI-FI------");
  Serial.print("Conectando-se na rede: ");
  Serial.println(SSID);
  Serial.println("Aguarde");

  reconnectWiFi();
}


/* Função: inicializa parâmetros de conexão MQTT(endereço do
           broker, porta e seta função de callback)
   Parâmetros: nenhum
   Retorno: nenhum
*/
void initMQTT(void)
{
  MQTT.setServer(BROKER_MQTT, BROKER_PORT);   //informa qual broker e porta deve ser conectado
  MQTT.setCallback(mqtt_callback);            //atribui função de callback (função chamada quando qualquer informação de um dos tópicos subescritos chega)
}

/* Função: função de callback
           esta função é chamada toda vez que uma informação de
           um dos tópicos subescritos chega)
   Parâmetros: nenhum
   Retorno: nenhum
*/

void mqtt_callback(char* topic, byte* payload, unsigned int length)
{
  String msg;
  /* obtem a string do payload recebido */
  for (int i = 0; i < length; i++)
  {
    char c = (char)payload[i];
    msg += c;
  }

  Serial.print("Chegou a seguinte string via MQTT: ");
  Serial.println(msg);
  Serial.print("topico: ");
  Serial.println(topic);

  /* toma ação dependendo da string recebida */
   if(msg[0] == '1'){
    if(msg[2] == '1'){
      tone(buzzer,2000);//Aciona o Buzzer
      digitalWrite(ledRecipiente1, HIGH);//liga o led do recipiente
      recipiente1Ativo = true;
    }
    else if(msg[2] == '2'){
      tone(buzzer,2000);//Aciona o Buzzer
      digitalWrite(ledRecipiente2, HIGH);//liga o led do recipiente
      recipiente2Ativo = true;    
    }
    else if(msg[2] == '3'){
      tone(buzzer,2000);//Aciona o Buzzer
      digitalWrite(ledRecipiente3, HIGH);//liga o led do recipiente
      recipiente3Ativo = true;
    }
    else if(msg[2] == '4'){
      tone(buzzer,2000);//Aciona o Buzzer
      digitalWrite(ledRecipiente4, HIGH);//liga o led do recipiente
      recipiente4Ativo = true;
    }
  }
  else{
    if(msg[2] == '1'){
      noTone(buzzer);//Desliga o Buzzer
      digitalWrite(ledRecipiente1, LOW);//Desliga o led do recipiente
      recipiente1Ativo = false;
    }
    else if(msg[2] == '2'){
      noTone(buzzer);//Desliga o Buzzer
      digitalWrite(ledRecipiente2, LOW);//Desliga o led do recipiente
      recipiente2Ativo = false;
    }
    else if(msg[2] == '3'){
      noTone(buzzer);//Desliga o Buzzer
      digitalWrite(ledRecipiente3, LOW);//Desliga o led do recipiente
      recipiente3Ativo = false;
    }
    else if(msg[2] == '4'){
      noTone(buzzer);//Desliga o Buzzer
      digitalWrite(ledRecipiente4, LOW);//Desliga o led do recipiente
      recipiente4Ativo = false;
    }
  }

  //   MQTT.publish(TOPICO_SUBSCRIBE_CAIXA_INTELIGENTE_ANDROID, "Alarme Ativado");
  }
/* Função: reconecta-se ao broker MQTT (caso ainda não esteja conectado ou em caso de a conexão cair)
           em caso de sucesso na conexão ou reconexão, o subscribe dos tópicos é refeito.
   Parâmetros: nenhum
   Retorno: nenhum
*/
void reconnectMQTT(void)
{
  while (!MQTT.connected())
  {
    Serial.print("* Tentando se conectar ao Broker MQTT: ");
    Serial.println(BROKER_MQTT);
    if (MQTT.connect(ID_MQTT))
    {
      Serial.println("Conectado com sucesso ao broker MQTT!");
      MQTT.subscribe(TOPICO_SUBSCRIBE_MED_BOX_SMART);
    }
    else
    {
      Serial.println("Falha ao reconectar no broker.");
      Serial.println("Havera nova tentatica de conexao em 2s");
      delay(2000);
    }
  }  
}

/* Função: verifica o estado das conexões WiFI e ao broker MQTT.
           Em caso de desconexão (qualquer uma das duas), a conexão
           é refeita.
   Parâmetros: nenhum
   Retorno: nenhum
*/
void VerificaConexoesWiFIEMQTT(void)
{
  if (!MQTT.connected())
    reconnectMQTT(); //se não há conexão com o Broker, a conexão é refeita

  reconnectWiFi(); //se não há conexão com o WiFI, a conexão é refeita
}

/* Função: reconecta-se ao WiFi
   Parâmetros: nenhum
   Retorno: nenhum
*/
void reconnectWiFi(void)
{
  //se já está conectado a rede WI-FI, nada é feito.
  //Caso contrário, são efetuadas tentativas de conexão
  if (WiFi.status() == WL_CONNECTED)
    return;

  WiFi.begin(SSID, PASSWORD); // Conecta na rede WI-FI

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(100);
    Serial.print(".");
  }

  Serial.println();
  Serial.print("Conectado com sucesso na rede ");
  Serial.print(SSID);
  Serial.println("\nIP obtido: ");
  Serial.println(WiFi.localIP());
}


void setup() {
  Serial.begin(9600); //Enviar e receber dados em 9600 baud
  delay(1000);
  Serial.println("Disciplina IoT2: acesso a nuvem via ESP32");
  delay(1000);
  randomSeed(analogRead(0));
  pinMode(recipiente1, INPUT);
  pinMode(recipiente2, INPUT);
  pinMode(recipiente3, INPUT);
  pinMode(recipiente4, INPUT);

  pinMode(ledRecipiente1, OUTPUT);
  pinMode(ledRecipiente2, OUTPUT);
  pinMode(ledRecipiente3, OUTPUT);
  pinMode(ledRecipiente4, OUTPUT);

   pinMode(buzzer,OUTPUT);
  /* Inicializa a conexao wi-fi */
  initWiFi();

  /* Inicializa a conexao ao broker MQTT */
  initMQTT();
}

// the loop function runs over and over again forever
void loop() {
  VerificaConexoesWiFIEMQTT();
  /* keep-alive da comunicação com broker MQTT */
  valorRecipiente1 = lerSensorLDR(recipiente1);
  valorRecipiente2 = lerSensorLDR(recipiente2);
  valorRecipiente3 = lerSensorLDR(recipiente3);
  valorRecipiente4 = lerSensorLDR(recipiente4);
  Serial.println(valorRecipiente4);
  if(valorRecipiente1 > 900){
    digitalWrite(ledRecipiente1, LOW);//Desliga o led do recipiente
    if(recipiente1Ativo && !recipiente4Ativo && !recipiente3Ativo && !recipiente2Ativo){
       noTone(buzzer);
    }
    if(recipiente1Ativo)
    MQTT.publish(TOPICO_PUBLISH_MED_BOX_SMART, "0/1");
    recipiente1Ativo = false;
  }
  if(valorRecipiente2 > 900){
    digitalWrite(ledRecipiente2, LOW);//Desliga o led do recipiente
    if(recipiente2Ativo && !recipiente4Ativo && !recipiente3Ativo && !recipiente1Ativo){
       noTone(buzzer);
    }
    if(recipiente2Ativo)
    MQTT.publish(TOPICO_PUBLISH_MED_BOX_SMART, "0/2");
    recipiente2Ativo = false;

  }
  if(valorRecipiente3 > 900){
    digitalWrite(ledRecipiente3, LOW);//Desliga o led do recipiente
    if(recipiente3Ativo && !recipiente4Ativo && !recipiente2Ativo && !recipiente1Ativo){
       noTone(buzzer);
    }
    if(recipiente3Ativo)
    MQTT.publish(TOPICO_PUBLISH_MED_BOX_SMART, "0/3");
    recipiente3Ativo = false;

  }
   if(valorRecipiente4 > 900){
    digitalWrite(ledRecipiente4, LOW);//Desliga o led do recipiente
    if(recipiente4Ativo && !recipiente3Ativo && !recipiente2Ativo && !recipiente1Ativo){
      noTone(buzzer);
    }
    if(recipiente4Ativo)
    MQTT.publish(TOPICO_PUBLISH_MED_BOX_SMART, "0/4");
    recipiente4Ativo = false;


  }
  MQTT.loop();
}
int lerSensorLDR(int recipiente){
return analogRead(recipiente);
}
