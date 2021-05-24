import 'dart:core';

class Datos {

  static List<String> skills = ["Resolución de conflictos"];

  static Map<String, List<String>> levels = {
    "Resolución de conflictos" : [
      "Típico te pasa en familia!",
      "Los amigos y mejores amigos!",
      "Cuando estoy en la escuela!",
    ]
  };

  static Map<String, List<String>> progress = {
    "Resolución de conflictos" : [
      "Nivel 1",
    ]
  };

  static Map<String, Map> imagenes = {
    "Resolución de conflictos" : {
      "Típico te pasa en familia!": [
        "1.png,2.png"
      ],
      "Los amigos y mejores amigos!": [
        "4.png,3.png",
        "6.png,7.png"
      ],
      "Cuando estoy en la escuela!": [
        "8.png,9.png",
      ]
    }
  };

  static Map<String, Map> audios = {
    "Resolución de conflictos" : {
      "Típico te pasa en familia!": [
        "audio_juguetes.aac"
      ],
      "Los amigos y mejores amigos!": [
        "audio_cartuchera.aac",
        "audio_peloteo.aac"
      ],
      "Cuando estoy en la escuela!": [
        "audio_recreo.aac",
      ]
    }
  };

  static Map<String, Map> stages = {
  "Resolución de conflictos" : {

  "Típico te pasa en familia!": [
      "A tu amigo se le han perdido sus juguetes favoritos y su hermana siempre los usa sin permiso."
          "\nHermana, no encuentro mis juguetes! "
          "\nYo no los he visto"
          "\n¿Qué crees hará tu amigo?",
    ],

    "Los amigos y mejores amigos!": [
      "¡Tu mejor amigo llevó una nueva caja de lápices de colores!\n"
          "Alguien tomó los lápices de tu mejor amigo\n"
          "Tu mejor amigo vió que fue el niño nuevo\n"
          "¿Qué crees que hará tu mejor amigo?",

      "Luis y Mateo son amigos del peloteo de los sábados pero casi nunca juegan! Ya se acerca el cumpleaños de Luis!\n"
          "La mamá de Luis hará una fiesta en el parque!\n"
          "Súper! Nos envías la invitación\n"
        "Pero Luis no invitó a Mateo, ¿Cómo reacionará Mateo?",
    ],

    "Cuando estoy en la escuela!": [
      "Hora de recreo!\n"
          "Luis va por su lonchera para comer un sánduche, una manzana y un jugo!\n"
          "Oh no! su amigo le acaba de quitar el sánduche\n"
      "¿Qué crees que hará Luis?"
    ],
  }
  };

  static Map<String, Map> solutions = {
    "Resolución de conflictos" : {
      "Escenario 1_1": [
        ["Reclamarle por perder sus juguetes y le pega en el brazo.", "Competidor"],
        ["Preguntarle si los ha usado y le pide buscarlos juntos.", "Colaborador"],
        ["Le pide a la mamá que le compre jueguetes nuevos, y los otros se los deja a su hermana.", "Concesivo"],
        ["Le cuenta a su mamá lo que pasó", "Elusivo"],
        ["El amigo busca otro juguete y deja a su hermana jugar con los suyos", "Complaciente"]
      ],
      "Escenario 1_2" :[
        ["Contarle a la profesora para que ella le pida los lápices", "Concesivo"],
        ["Habla con el niño para compartir los lápices", "Colaborador"],
        ["Regresar a casa sin los lápices de colores", "Elusivo"],
        ["Regala sus lápices al nuevo niño","Complaciente"],
        ["Le quita los lápices de colores de la mano del niño nuevo", "Competidor"]
      ],
      "Escenario 2_2" :[
        ["Enfadarse y dejarle de hablar por no invitarlo", "Competidor"],
        ["Va al parque para darle una sorpresa con un gran regalo.", "Complaciente"],
        ["No importa porque no son amigos tan cercanos.", "Elusivo"],
        ["Se entristece, pero en la siguiente clase habla con él", "Colaborador"],
        ["Le dice que si lo invita, el tambien lo invitará a su cumpleaños y así ambos tienen regalos", "Concesivo"]
      ],
      "Escenario 1_3": [
        ["Le da el sánduche, mientras él se come la manzana.", "Complaciente"],
        ["Se enoja, pero luego le pregunta si tiene hambre para poder darle la mitad de su sánduche", "Colaborador"],
        ["Deja que se lleve el sánduche y va donde la profesora a contárselo.", "Elusivo"],
        ["Le pega con la lonchera y recupera su sanduche.", "Competidor"],
        ["Le pide que le devuelva el sánduche y él le da la manzana", "Concesivo"]
      ]
    }
  };

  static Map<String, Map> correct_solution = {
    "Resolución de conflictos" : {
      "Escenario 1_1": [
        1,
        "",
        ""
      ],
      "Escenario 1_2" :[
        3,
        "",
        ""
      ],
      "Escenario 2_2" :[
        3,
        "Siempre es importante reconocer a las personas y ser cortés aunque no la conozcas. Evitar tomar una decisión apresurada cuando nos sentimos enojados o con resentimiento.",
        "Estás en aprietos, recuerda que hay que ser cortes con los vecinos y personas aunque no sean cercanos."
      ],
      "Escenario 1_3": [
        1,
        "Debemos tomar una actitud adecuada y preguntar antes de actuar o tomar una decisión. La comunicación es importante hasta para tratar a tus amigos!",
        "Puedes hacerlo mejor. Recuerda que no siempre conocemos lo que pasa en la vida de cada persona, así que debemos ser generosos y pensar antes de actuar."
      ]
    }


  };


 static List<String> categorias_descripction = [
    "Conducta dirigida a aquellos niños que son asertivos y no colaboradores, es decir procuran satisfacer sus propios intereses y defender su postura como la correcta.",
    "Refiere a los niños que al mismo tiempo son asertivoss y cooperadores, lo opuesto al estilo evitador, es decir buscan trabajar con la otra persona para encontrar una solución que cumpla satisfactoriamente con los deseos y necesidades de ambos.",
    "Son los niños que buscan llegar a un acuerdo muto donde ambas partes se satisfagan parcialmente, es decir contemplan un rango medio de asertividad y colaboración.",
    "Conducta que refleja que los niños no buscan solución inmediata, entre sus intereses ni los del otro, es decir aplaza el momento de resolver un conflicto, personas no asertivas ni colaboradoras, no buscan en forma activa sus propios intereses ni los del otro.",
    "Se basa en que los niños procuran pensar más en los intereses del otro, siendo generosos y altruistas."
  ];

 static List<String> categorias = [
   "Competitivo",
   "Colaborador",
   "Concesivo",
   "Elusivo",
   "Complaciente"
 ];

}