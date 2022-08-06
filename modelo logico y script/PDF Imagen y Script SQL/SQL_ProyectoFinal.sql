/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     20/07/2022 10:00:06 p. m.                    */
/*==============================================================*/


alter table ASISTENCIA
   drop constraint FK_ASISTENC_ESTUDIANT_ESTUDIAN;

alter table CURSODEPORTIVO
   drop constraint FK_CURSODEP_DEPORTE_C_DEPORTE;

alter table EMPLEADO
   drop constraint FK_EMPLEADO_CARGOEMPL_CARGOEMP;

alter table EMPLEADO
   drop constraint FK_EMPLEADO_SEDE_EMPL_SEDE;

alter table ENTRENAMIENTO
   drop constraint FK_ENTRENAM_EQUIPOUNI_EQUIPOUN;

alter table EQUIPOUNIVERSITARIO
   drop constraint FK_EQUIPOUN_EMPLEADO__EMPLEADO;

alter table ESPACIOFISICO
   drop constraint FK_ESPACIOF_ENTRENAMI_ENTRENAM;

alter table ESPACIOFISICO
   drop constraint FK_ESPACIOF_SEDE_ESPA_SEDE;

alter table ESTUDIANTE
   drop constraint FK_ESTUDIAN_ROLESTUDI_ROLESTUD;

alter table ESTUDIANTE
   drop constraint FK_ESTUDIAN_SEDE_ESTU_SEDE;

alter table ESTUDIANTEACTIVO
   drop constraint FK_ESTUDIAN_EQUIPOUNI_EQUIPOUN;

alter table ESTUDIANTEACTIVO
   drop constraint FK_ESTUDIAN_ESTUDIANT_ESTUDIAN;

alter table ESTUDIANTEACTIVO
   drop constraint FK_ESTUDIAN_PERIODOAC_PERIODOA;

alter table HISTORICOCURSO
   drop constraint FK_HISTORIC_CURSODEPO_CURSODEP;

alter table HISTORICOCURSO
   drop constraint FK_HISTORIC_EMPLEADO__EMPLEADO;

alter table HISTORICOCURSO
   drop constraint FK_HISTORIC_ESTUDIANT_ESTUDIA2;

alter table HISTORICOCURSO
   drop constraint FK_HISTORIC_RELATIONS_ESPACIOF;

alter table HISTORICOPRACTICA
   drop constraint FK_HISTORIC_ESPACIOFI_ESPACIOF;

alter table HISTORICOPRACTICA
   drop constraint FK_HISTORIC_ESTUDIANT_ESTUDIAN;

alter table HISTORICOPRACTICA
   drop constraint FK_HISTORIC_PASANTE_E_ESTUDIAN;

alter table HISTORICOPRACTICA
   drop constraint FK_HISTORIC_PRACTICAL_PRACTICA;

alter table MATERIAL_DEPORTE
   drop constraint FK_MATERIAL_SE_USA_PO_MATERIAL;

alter table MATERIAL_DEPORTE
   drop constraint FK_MATERIAL_TIENE_DEPORTE;

alter table PRESTAMO
   drop constraint FK_PRESTAMO_DOCENTE_E_EMPLEADO;

alter table PRESTAMO
   drop constraint FK_PRESTAMO_ENTRENADO_EMPLEADO;

alter table PRESTAMO
   drop constraint FK_PRESTAMO_MATERIAL__MATERIAL;

alter table PRESTAMO
   drop constraint FK_PRESTAMO_PASANTE_E_ESTUDIAN;

drop index ESTUDIANTEACTIVO_ASISTENCIA_FK;

drop table ASISTENCIA cascade constraints;

drop table CARGOEMPLEADO cascade constraints;

drop index DEPORTE_CURSODEPORTIVO_FK;

drop table CURSODEPORTIVO cascade constraints;

drop table DEPORTE cascade constraints;

drop index CARGOEMPLEADO_EMPLEADO_FK;

drop index SEDE_EMPLEADO_FK;

drop table EMPLEADO cascade constraints;

drop index EQUIPOUNIVERSITARIO_ENTRENAMIE;

drop table ENTRENAMIENTO cascade constraints;

drop index EMPLEADO_EQUIPOUNIVERSITARIO_F;

drop table EQUIPOUNIVERSITARIO cascade constraints;

drop index ENTRENAMIENTO_ESPACIOFISICO_FK;

drop index SEDE_ESPACIOFISICO_FK;

drop table ESPACIOFISICO cascade constraints;

drop index SEDE_ESTUDIANTE_FK;

drop index ROLESTUDIANTE_ESTUDIANTE_FK;

drop table ESTUDIANTE cascade constraints;

drop index EQUIPOUNIVERSITARIO_ESTUDIANTE;

drop index ESTUDIANTE_ESTUDIANTEACTIVO_FK;

drop index PERIODOACADEMICO_ESTUDIANTEACT;

drop table ESTUDIANTEACTIVO cascade constraints;

drop index RELATIONSHIP_11_FK;

drop index CURSODEPORTIVO_HISTORICOCURSO_;

drop index EMPLEADO_DOCENTE_HISTORICOCURS;

drop index ESTUDIANTEACTIVO_HISTORICOCURS;

drop table HISTORICOCURSO cascade constraints;

drop index ESPACIOFISICO_HISTORICOPRACTIC;

drop index PRACTICALIBRE_HISTORICOPRACTIC;

drop index PASANTE_ESTUDIANTEACTIVO_HISTO;

drop index ESTUDIANTE_ESTUDIANTEACTIVO_HI;

drop table HISTORICOPRACTICA cascade constraints;

drop table MATERIAL cascade constraints;

drop index TIENE_FK;

drop index SE_USA_POR_FK;

drop table MATERIAL_DEPORTE cascade constraints;

drop table PERIODOACADEMICO cascade constraints;

drop table PRACTICALIBRE cascade constraints;

drop index PASANTE_ESTUDIANTEACTIVO_PREST;

drop index ENTRENADOR_EMPLEADO_PRESTAMO_F;

drop index DOCENTE_EMPLEADO_PRESTAMO_FK;

drop index MATERIAL_PRESTAMO_FK;

drop table PRESTAMO cascade constraints;

drop table ROLESTUDIANTE cascade constraints;

drop table SEDE cascade constraints;

/*==============================================================*/
/* Table: ASISTENCIA                                            */
/*==============================================================*/
create table ASISTENCIA (
   IDASISTENCIA         NUMBER(20,0)          not null,
   IDESTUDIANTEACTIVO   NUMBER(15)            not null,
   FECHAASISTENCIA      DATE                  not null,
   constraint PK_ASISTENCIA primary key (IDASISTENCIA)
);

comment on table ASISTENCIA is
'Entidad que almacena el registro de asistencia que pertenecen a un equipo universitario';

/*==============================================================*/
/* Index: ESTUDIANTEACTIVO_ASISTENCIA_FK                        */
/*==============================================================*/
create index ESTUDIANTEACTIVO_ASISTENCIA_FK on ASISTENCIA (
   IDESTUDIANTEACTIVO ASC
);

/*==============================================================*/
/* Table: CARGOEMPLEADO                                         */
/*==============================================================*/
create table CARGOEMPLEADO (
   IDCARGOEMPLEADO      NUMBER(2,0)           not null,
   NOMBRECARGOEMPLEADO  VARCHAR2(50)          not null,
   constraint PK_CARGOEMPLEADO primary key (IDCARGOEMPLEADO)
);

comment on table CARGOEMPLEADO is
'Entidad encargadad de almacenar el tipo de cargo que desempeña el empleado Universidad Distritla que pueden ser:
Director Deportivo
Fisioterapeutas
Deportivos
Varios entrenadora(o)s
Auxiliares deportivos 
Docentes de deporte';

/*==============================================================*/
/* Table: CURSODEPORTIVO                                        */
/*==============================================================*/
create table CURSODEPORTIVO (
   IDCURSODEPORTIVO     NUMBER(2,0)           not null,
   IDDEPORTE            NUMBER(5,0)           not null,
   NOMBRECURSODEPORTIVO VARCHAR2(50)          not null,
   HORARIOCURSODEPORTIVO VARCHAR2(200)         not null,
   CUPOSCUSRODEPORTIVO  NUMBER(2,0)           not null,
   CREDITOSCURSODEPORTIVO NUMBER(1,0)           not null,
   constraint PK_CURSODEPORTIVO primary key (IDCURSODEPORTIVO)
);

comment on table CURSODEPORTIVO is
'Entidad que almacena la informacion de las asignaturas de la unidad deportiva ';

/*==============================================================*/
/* Index: DEPORTE_CURSODEPORTIVO_FK                             */
/*==============================================================*/
create index DEPORTE_CURSODEPORTIVO_FK on CURSODEPORTIVO (
   IDDEPORTE ASC
);

/*==============================================================*/
/* Table: DEPORTE                                               */
/*==============================================================*/
create table DEPORTE (
   IDDEPORTE            NUMBER(5,0)           not null,
   NOMBREDEPORTE        VARCHAR2(30)          not null,
   DETALLESDEPORTE      VARCHAR2(500),
   constraint PK_DEPORTE primary key (IDDEPORTE)
);

comment on table DEPORTE is
'Entidad que almacena la informacion del tipo de deorte en la unidad deportiva:
Tenis 
Tenis mesa
Futbol
Futbol salón
Voleibol
Varias modalidades de arte marciales
Boxeo
Gimnasia
Natación
Entre otros';

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   IDCODIGOEMPLEADO     NUMBER(15,0)          not null,
   IDSEDE               VARCHAR2(2)           not null,
   IDCARGOEMPLEADO      NUMBER(2,0)           not null,
   NOMBRESEMPLEADO      VARCHAR2(50)          not null,
   APELLIDOSEMPLEADO    VARCHAR2(50)          not null,
   CEDULAEMPLEADO       NUMBER(15,0)          not null,
   constraint PK_EMPLEADO primary key (IDCODIGOEMPLEADO)
);

comment on table EMPLEADO is
'Entidad encargadad de almacenar la informacion de los empleados de la Universidad Distrital';

/*==============================================================*/
/* Index: SEDE_EMPLEADO_FK                                      */
/*==============================================================*/
create index SEDE_EMPLEADO_FK on EMPLEADO (
   IDSEDE ASC
);

/*==============================================================*/
/* Index: CARGOEMPLEADO_EMPLEADO_FK                             */
/*==============================================================*/
create index CARGOEMPLEADO_EMPLEADO_FK on EMPLEADO (
   IDCARGOEMPLEADO ASC
);

/*==============================================================*/
/* Table: ENTRENAMIENTO                                         */
/*==============================================================*/
create table ENTRENAMIENTO (
   IDENTRENAMIENTO      NUMBER(20,0)          not null,
   IDEQUIPOUNIVERSITARIO NUMBER(10,0)          not null,
   HORAINICIALENTRENAMIENTO DATE                  not null,
   HORAFINALENTRENAMIENTO DATE                  not null,
   constraint PK_ENTRENAMIENTO primary key (IDENTRENAMIENTO)
);

comment on table ENTRENAMIENTO is
'Entidad que almacena la informacion de los entrenamientos realizados por los equipos';

/*==============================================================*/
/* Index: EQUIPOUNIVERSITARIO_ENTRENAMIE                        */
/*==============================================================*/
create index EQUIPOUNIVERSITARIO_ENTRENAMIE on ENTRENAMIENTO (
   IDEQUIPOUNIVERSITARIO ASC
);

/*==============================================================*/
/* Table: EQUIPOUNIVERSITARIO                                   */
/*==============================================================*/
create table EQUIPOUNIVERSITARIO (
   IDEQUIPOUNIVERSITARIO NUMBER(10,0)          not null,
   IDCODIGOEMPLEADO     NUMBER(15,0)          not null,
   NOMBREEQUIPOUNIVERSITARIO VARCHAR2(50)          not null,
   constraint PK_EQUIPOUNIVERSITARIO primary key (IDEQUIPOUNIVERSITARIO)
);

comment on table EQUIPOUNIVERSITARIO is
'Entidad que almacena la informacion de los equipos universitarios que existen a cargo de un entrenador';

/*==============================================================*/
/* Index: EMPLEADO_EQUIPOUNIVERSITARIO_F                        */
/*==============================================================*/
create index EMPLEADO_EQUIPOUNIVERSITARIO_F on EQUIPOUNIVERSITARIO (
   IDCODIGOEMPLEADO ASC
);

/*==============================================================*/
/* Table: ESPACIOFISICO                                         */
/*==============================================================*/
create table ESPACIOFISICO (
   IDESPACIOFISICO      NUMBER(2,0)           not null,
   IDSEDE               VARCHAR2(2)           not null,
   IDENTRENAMIENTO      NUMBER(20,0)          not null,
   NOMBREESPACIOFISICO  VARCHAR2(30)          not null,
   UBICACIONESPACIOFISICO VARCHAR2(30)          not null,
   constraint PK_ESPACIOFISICO primary key (IDESPACIOFISICO)
);

comment on table ESPACIOFISICO is
'Entidad que almacena la informacion de los espacios fisicos de una sede';

/*==============================================================*/
/* Index: SEDE_ESPACIOFISICO_FK                                 */
/*==============================================================*/
create index SEDE_ESPACIOFISICO_FK on ESPACIOFISICO (
   IDSEDE ASC
);

/*==============================================================*/
/* Index: ENTRENAMIENTO_ESPACIOFISICO_FK                        */
/*==============================================================*/
create index ENTRENAMIENTO_ESPACIOFISICO_FK on ESPACIOFISICO (
   IDENTRENAMIENTO ASC
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   CODIGOESTUDIANTE     NUMBER(15,0)          not null,
   IDROLESTUDIANTE      NUMBER(2)             not null,
   IDSEDE               VARCHAR2(2)           not null,
   NOMBRESESTUDIANTE    VARCHAR2(50)          not null,
   APELLIDOSESTUDIANTE  VARCHAR2(50)          not null,
   NUMIDENTESTUDIANTE   NUMBER(15,0)          not null,
   constraint PK_ESTUDIANTE primary key (CODIGOESTUDIANTE)
);

comment on table ESTUDIANTE is
'Entidad que almacenara los datos de los estudiantes de la Universidad Distrital';

/*==============================================================*/
/* Index: ROLESTUDIANTE_ESTUDIANTE_FK                           */
/*==============================================================*/
create index ROLESTUDIANTE_ESTUDIANTE_FK on ESTUDIANTE (
   IDROLESTUDIANTE ASC
);

/*==============================================================*/
/* Index: SEDE_ESTUDIANTE_FK                                    */
/*==============================================================*/
create index SEDE_ESTUDIANTE_FK on ESTUDIANTE (
   IDSEDE ASC
);

/*==============================================================*/
/* Table: ESTUDIANTEACTIVO                                      */
/*==============================================================*/
create table ESTUDIANTEACTIVO (
   IDESTUDIANTEACTIVO   NUMBER(15)            not null,
   IDEQUIPOUNIVERSITARIO NUMBER(10,0),
   CODIGOESTUDIANTE     NUMBER(15,0),
   IDPERIODOACADEMICO   NUMBER(10,0)          not null,
   constraint PK_ESTUDIANTEACTIVO primary key (IDESTUDIANTEACTIVO)
);

comment on table ESTUDIANTEACTIVO is
'Entidad que almacena los estudiante activos de un periodo academico';

/*==============================================================*/
/* Index: PERIODOACADEMICO_ESTUDIANTEACT                        */
/*==============================================================*/
create index PERIODOACADEMICO_ESTUDIANTEACT on ESTUDIANTEACTIVO (
   IDPERIODOACADEMICO ASC
);

/*==============================================================*/
/* Index: ESTUDIANTE_ESTUDIANTEACTIVO_FK                        */
/*==============================================================*/
create index ESTUDIANTE_ESTUDIANTEACTIVO_FK on ESTUDIANTEACTIVO (
   CODIGOESTUDIANTE ASC
);

/*==============================================================*/
/* Index: EQUIPOUNIVERSITARIO_ESTUDIANTE                        */
/*==============================================================*/
create index EQUIPOUNIVERSITARIO_ESTUDIANTE on ESTUDIANTEACTIVO (
   IDEQUIPOUNIVERSITARIO ASC
);

/*==============================================================*/
/* Table: HISTORICOCURSO                                        */
/*==============================================================*/
create table HISTORICOCURSO (
   IDESTUDIANTEACTIVO   NUMBER(15)            not null,
   IDHISTORICOCURSO     NUMBER(10,0)          not null,
   IDCURSODEPORTIVO     NUMBER(2,0)           not null,
   IDCODIGOEMPLEADO     NUMBER(15,0)          not null,
   IDESPACIOFISICO      NUMBER(2,0)           not null,
   constraint PK_HISTORICOCURSO primary key (IDESTUDIANTEACTIVO, IDHISTORICOCURSO)
);

comment on table HISTORICOCURSO is
'Entidad que almacena la informacion de los cursos, los estudiantes que participan en estos asi como el docente ';

/*==============================================================*/
/* Index: ESTUDIANTEACTIVO_HISTORICOCURS                        */
/*==============================================================*/
create index ESTUDIANTEACTIVO_HISTORICOCURS on HISTORICOCURSO (
   IDESTUDIANTEACTIVO ASC
);

/*==============================================================*/
/* Index: EMPLEADO_DOCENTE_HISTORICOCURS                        */
/*==============================================================*/
create index EMPLEADO_DOCENTE_HISTORICOCURS on HISTORICOCURSO (
   IDCODIGOEMPLEADO ASC
);

/*==============================================================*/
/* Index: CURSODEPORTIVO_HISTORICOCURSO_                        */
/*==============================================================*/
create index CURSODEPORTIVO_HISTORICOCURSO_ on HISTORICOCURSO (
   IDCURSODEPORTIVO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on HISTORICOCURSO (
   IDESPACIOFISICO ASC
);

/*==============================================================*/
/* Table: HISTORICOPRACTICA                                     */
/*==============================================================*/
create table HISTORICOPRACTICA (
   IDHISTORICO          NUMBER(20,0)          not null,
   IDESTUDIANTEACTIVO   NUMBER(15)            not null,
   IDPRACTICALIBRE      NUMBER(20,0)          not null,
   IDESPACIOFISICO      NUMBER(2,0)           not null,
   EST_IDESTUDIANTEACTIVO NUMBER(15)            not null,
   constraint PK_HISTORICOPRACTICA primary key (IDHISTORICO)
);

comment on table HISTORICOPRACTICA is
'Entidad que almacena la informacion del pasante que esta acargo que cada practica libre con la fecha, asi como de los estudiantes que participaron en esa practica libre';

/*==============================================================*/
/* Index: ESTUDIANTE_ESTUDIANTEACTIVO_HI                        */
/*==============================================================*/
create index ESTUDIANTE_ESTUDIANTEACTIVO_HI on HISTORICOPRACTICA (
   EST_IDESTUDIANTEACTIVO ASC
);

/*==============================================================*/
/* Index: PASANTE_ESTUDIANTEACTIVO_HISTO                        */
/*==============================================================*/
create index PASANTE_ESTUDIANTEACTIVO_HISTO on HISTORICOPRACTICA (
   IDESTUDIANTEACTIVO ASC
);

/*==============================================================*/
/* Index: PRACTICALIBRE_HISTORICOPRACTIC                        */
/*==============================================================*/
create index PRACTICALIBRE_HISTORICOPRACTIC on HISTORICOPRACTICA (
   IDPRACTICALIBRE ASC
);

/*==============================================================*/
/* Index: ESPACIOFISICO_HISTORICOPRACTIC                        */
/*==============================================================*/
create index ESPACIOFISICO_HISTORICOPRACTIC on HISTORICOPRACTICA (
   IDESPACIOFISICO ASC
);

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create table MATERIAL (
   IDMATERIAL           NUMBER(3,0)           not null,
   NOMBREMATERIAL       VARCHAR2(30)          not null,
   ESTADOMATERIAL       VARCHAR2(15)          not null,
   CANTIDADMATERIAL     NUMBER(3,0)           not null,
   constraint PK_MATERIAL primary key (IDMATERIAL)
);

comment on table MATERIAL is
'Entidad que almacena la informacion de los materiales que se utilizaran en cada curso, asi como su estado:
Dañados,
Prestados
Perdidos,
Reparados 
En mantenimiento
';

/*==============================================================*/
/* Table: MATERIAL_DEPORTE                                      */
/*==============================================================*/
create table MATERIAL_DEPORTE (
   IDMATERIAL           NUMBER(3,0)           not null,
   IDDEPORTE            NUMBER(5,0)           not null,
   constraint PK_MATERIAL_DEPORTE primary key (IDMATERIAL, IDDEPORTE)
);

/*==============================================================*/
/* Index: SE_USA_POR_FK                                         */
/*==============================================================*/
create index SE_USA_POR_FK on MATERIAL_DEPORTE (
   IDMATERIAL ASC
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on MATERIAL_DEPORTE (
   IDDEPORTE ASC
);

/*==============================================================*/
/* Table: PERIODOACADEMICO                                      */
/*==============================================================*/
create table PERIODOACADEMICO (
   IDPERIODOACADEMICO   NUMBER(10,0)          not null,
   NOMBREPERIODOACADEMICO VARCHAR2(6)           not null,
   constraint PK_PERIODOACADEMICO primary key (IDPERIODOACADEMICO)
);

comment on table PERIODOACADEMICO is
'Entidad que almacena el periodo academico de cada semestre universitario';

/*==============================================================*/
/* Table: PRACTICALIBRE                                         */
/*==============================================================*/
create table PRACTICALIBRE (
   IDPRACTICALIBRE      NUMBER(20,0)          not null,
   NOMBREPRACTICALIBRE  VARCHAR2(50)          not null,
   FECHAINICIALPRACTICALIBRE DATE                  not null,
   FECHAFINALPRACTICALIBRE DATE                  not null,
   constraint PK_PRACTICALIBRE primary key (IDPRACTICALIBRE)
);

comment on table PRACTICALIBRE is
'Entidad que almacena la informacion de las practicas solitadas diariamente';

/*==============================================================*/
/* Table: PRESTAMO                                              */
/*==============================================================*/
create table PRESTAMO (
   IDPRESTAMO           NUMBER(10,0)          not null,
   IDMATERIAL           NUMBER(3,0)           not null,
   IDESTUDIANTEACTIVO   NUMBER(15),
   IDCODIGOEMPLEADO     NUMBER(15,0),
   EMP_IDCODIGOEMPLEADO NUMBER(15,0),
   FECHAINICIOPRESTADO  DATE                  not null,
   FECHAFINALPRESTAMO   DATE,
   constraint PK_PRESTAMO primary key (IDPRESTAMO)
);

comment on table PRESTAMO is
'Entidad que almacena la informacion de los prestamos de materiales a cargo de un Docente, Entrenador o Pasante 
';

/*==============================================================*/
/* Index: MATERIAL_PRESTAMO_FK                                  */
/*==============================================================*/
create index MATERIAL_PRESTAMO_FK on PRESTAMO (
   IDMATERIAL ASC
);

/*==============================================================*/
/* Index: DOCENTE_EMPLEADO_PRESTAMO_FK                          */
/*==============================================================*/
create index DOCENTE_EMPLEADO_PRESTAMO_FK on PRESTAMO (
   EMP_IDCODIGOEMPLEADO ASC
);

/*==============================================================*/
/* Index: ENTRENADOR_EMPLEADO_PRESTAMO_F                        */
/*==============================================================*/
create index ENTRENADOR_EMPLEADO_PRESTAMO_F on PRESTAMO (
   IDCODIGOEMPLEADO ASC
);

/*==============================================================*/
/* Index: PASANTE_ESTUDIANTEACTIVO_PREST                        */
/*==============================================================*/
create index PASANTE_ESTUDIANTEACTIVO_PREST on PRESTAMO (
   IDESTUDIANTEACTIVO ASC
);

/*==============================================================*/
/* Table: ROLESTUDIANTE                                         */
/*==============================================================*/
create table ROLESTUDIANTE (
   IDROLESTUDIANTE      NUMBER(2)             not null,
   NOMBREROLESTUDIANTE  VARCHAR2(10)          not null,
   constraint PK_ROLESTUDIANTE primary key (IDROLESTUDIANTE)
);

comment on table ROLESTUDIANTE is
'Entidad encargada de definir el rol del estudiante de la Universidad Distrital:
Para saber si es Pasante o no ';

/*==============================================================*/
/* Table: SEDE                                                  */
/*==============================================================*/
create table SEDE (
   IDSEDE               VARCHAR2(2)           not null,
   NOMBRESEDE           VARCHAR2(50)          not null,
   UBICACIONSEDE        VARCHAR2(50)          not null,
   URL_IMAGESEDE        VARCHAR2(100),
   constraint PK_SEDE primary key (IDSEDE)
);

comment on table SEDE is
'Entidad encargada de almacenar las sedes de la Universidad Distrital.';

alter table ASISTENCIA
   add constraint FK_ASISTENC_ESTUDIANT_ESTUDIAN foreign key (IDESTUDIANTEACTIVO)
      references ESTUDIANTEACTIVO (IDESTUDIANTEACTIVO);

alter table CURSODEPORTIVO
   add constraint FK_CURSODEP_DEPORTE_C_DEPORTE foreign key (IDDEPORTE)
      references DEPORTE (IDDEPORTE);

alter table EMPLEADO
   add constraint FK_EMPLEADO_CARGOEMPL_CARGOEMP foreign key (IDCARGOEMPLEADO)
      references CARGOEMPLEADO (IDCARGOEMPLEADO);

alter table EMPLEADO
   add constraint FK_EMPLEADO_SEDE_EMPL_SEDE foreign key (IDSEDE)
      references SEDE (IDSEDE);

alter table ENTRENAMIENTO
   add constraint FK_ENTRENAM_EQUIPOUNI_EQUIPOUN foreign key (IDEQUIPOUNIVERSITARIO)
      references EQUIPOUNIVERSITARIO (IDEQUIPOUNIVERSITARIO);

alter table EQUIPOUNIVERSITARIO
   add constraint FK_EQUIPOUN_EMPLEADO__EMPLEADO foreign key (IDCODIGOEMPLEADO)
      references EMPLEADO (IDCODIGOEMPLEADO);

alter table ESPACIOFISICO
   add constraint FK_ESPACIOF_ENTRENAMI_ENTRENAM foreign key (IDENTRENAMIENTO)
      references ENTRENAMIENTO (IDENTRENAMIENTO);

alter table ESPACIOFISICO
   add constraint FK_ESPACIOF_SEDE_ESPA_SEDE foreign key (IDSEDE)
      references SEDE (IDSEDE);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_ROLESTUDI_ROLESTUD foreign key (IDROLESTUDIANTE)
      references ROLESTUDIANTE (IDROLESTUDIANTE);

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_SEDE_ESTU_SEDE foreign key (IDSEDE)
      references SEDE (IDSEDE);

alter table ESTUDIANTEACTIVO
   add constraint FK_ESTUDIAN_EQUIPOUNI_EQUIPOUN foreign key (IDEQUIPOUNIVERSITARIO)
      references EQUIPOUNIVERSITARIO (IDEQUIPOUNIVERSITARIO);

alter table ESTUDIANTEACTIVO
   add constraint FK_ESTUDIAN_ESTUDIANT_ESTUDIAN foreign key (CODIGOESTUDIANTE)
      references ESTUDIANTE (CODIGOESTUDIANTE);

alter table ESTUDIANTEACTIVO
   add constraint FK_ESTUDIAN_PERIODOAC_PERIODOA foreign key (IDPERIODOACADEMICO)
      references PERIODOACADEMICO (IDPERIODOACADEMICO);

alter table HISTORICOCURSO
   add constraint FK_HISTORIC_CURSODEPO_CURSODEP foreign key (IDCURSODEPORTIVO)
      references CURSODEPORTIVO (IDCURSODEPORTIVO);

alter table HISTORICOCURSO
   add constraint FK_HISTORIC_EMPLEADO__EMPLEADO foreign key (IDCODIGOEMPLEADO)
      references EMPLEADO (IDCODIGOEMPLEADO);

alter table HISTORICOCURSO
   add constraint FK_HISTORIC_ESTUDIANT_ESTUDIA2 foreign key (IDESTUDIANTEACTIVO)
      references ESTUDIANTEACTIVO (IDESTUDIANTEACTIVO);

alter table HISTORICOCURSO
   add constraint FK_HISTORIC_RELATIONS_ESPACIOF foreign key (IDESPACIOFISICO)
      references ESPACIOFISICO (IDESPACIOFISICO);

alter table HISTORICOPRACTICA
   add constraint FK_HISTORIC_ESPACIOFI_ESPACIOF foreign key (IDESPACIOFISICO)
      references ESPACIOFISICO (IDESPACIOFISICO);

alter table HISTORICOPRACTICA
   add constraint FK_HISTORIC_ESTUDIANT_ESTUDIAN foreign key (EST_IDESTUDIANTEACTIVO)
      references ESTUDIANTEACTIVO (IDESTUDIANTEACTIVO);

alter table HISTORICOPRACTICA
   add constraint FK_HISTORIC_PASANTE_E_ESTUDIAN foreign key (IDESTUDIANTEACTIVO)
      references ESTUDIANTEACTIVO (IDESTUDIANTEACTIVO);

alter table HISTORICOPRACTICA
   add constraint FK_HISTORIC_PRACTICAL_PRACTICA foreign key (IDPRACTICALIBRE)
      references PRACTICALIBRE (IDPRACTICALIBRE);

alter table MATERIAL_DEPORTE
   add constraint FK_MATERIAL_SE_USA_PO_MATERIAL foreign key (IDMATERIAL)
      references MATERIAL (IDMATERIAL);

alter table MATERIAL_DEPORTE
   add constraint FK_MATERIAL_TIENE_DEPORTE foreign key (IDDEPORTE)
      references DEPORTE (IDDEPORTE);

alter table PRESTAMO
   add constraint FK_PRESTAMO_DOCENTE_E_EMPLEADO foreign key (EMP_IDCODIGOEMPLEADO)
      references EMPLEADO (IDCODIGOEMPLEADO);

alter table PRESTAMO
   add constraint FK_PRESTAMO_ENTRENADO_EMPLEADO foreign key (IDCODIGOEMPLEADO)
      references EMPLEADO (IDCODIGOEMPLEADO);

alter table PRESTAMO
   add constraint FK_PRESTAMO_MATERIAL__MATERIAL foreign key (IDMATERIAL)
      references MATERIAL (IDMATERIAL);

alter table PRESTAMO
   add constraint FK_PRESTAMO_PASANTE_E_ESTUDIAN foreign key (IDESTUDIANTEACTIVO)
      references ESTUDIANTEACTIVO (IDESTUDIANTEACTIVO);

