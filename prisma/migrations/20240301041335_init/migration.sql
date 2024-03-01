/*
  Warnings:

  - You are about to drop the `todo` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `todo`;

-- CreateTable
CREATE TABLE `catalogo_bandera` (
    `id_bandera` INTEGER NOT NULL,
    `bandera` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id_bandera`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `catalogo_enfermedad` (
    `id_enfermedad` INTEGER NOT NULL,
    `enfermedad` VARCHAR(200) NOT NULL,

    PRIMARY KEY (`id_enfermedad`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `catalogo_estado_solicitud` (
    `id_estado_solicitud` INTEGER NOT NULL,
    `estado_solicitud` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id_estado_solicitud`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `catalogo_genero` (
    `id_genero` INTEGER NOT NULL,
    `genero` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id_genero`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `catalogo_institucion` (
    `id_institucion` INTEGER NOT NULL,
    `institucion` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id_institucion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `catalogo_medicamento` (
    `id_medicamento` INTEGER NOT NULL,
    `nombre_medicamento` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`id_medicamento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `catalogo_presentacion_medicamento` (
    `id_presentacion_medicamento` INTEGER NOT NULL,
    `presentacion_medicamento` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id_presentacion_medicamento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `catalogo_tipo_usuario` (
    `id_tipo_usuario` INTEGER NOT NULL,
    `tipo_usuario` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id_tipo_usuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `catalogo_titulo` (
    `id_titulo` INTEGER NOT NULL,
    `titulo` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id_titulo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `catalogo_unidad` (
    `id_unidad` INTEGER NOT NULL,
    `unidad` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id_unidad`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `datos_profesionales` (
    `id_trabajador` INTEGER NOT NULL,
    `cedula` VARCHAR(10) NOT NULL,
    `id_titulo` INTEGER NOT NULL,
    `id_institucion` INTEGER NOT NULL,

    UNIQUE INDEX `datos_profesionales_id_trabajador_key`(`id_trabajador`),
    PRIMARY KEY (`id_trabajador`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `datos_profesionales_solicitud` (
    `id_datos_profesionales_solicitud` INTEGER NOT NULL,
    `id_solicitud_empleo` INTEGER NOT NULL,
    `cedula` VARCHAR(10) NOT NULL,
    `id_institucion` INTEGER NOT NULL,
    `id_titulo` INTEGER NOT NULL,

    PRIMARY KEY (`id_datos_profesionales_solicitud`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enfermedad_paciente` (
    `id_paciente` INTEGER NOT NULL,
    `id_enfermedad` INTEGER NOT NULL,

    PRIMARY KEY (`id_paciente`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `horario_solicitud_trabajador` (
    `id_horario` INTEGER NOT NULL,
    `id_solicitud_empleo` INTEGER NOT NULL,
    `dia_semana` VARCHAR(10) NOT NULL,
    `trabaja` BOOLEAN NOT NULL,
    `hora_inicio` DATETIME(3) NOT NULL,
    `hora_fin` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_horario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `horario_trabajador` (
    `id_horario` INTEGER NOT NULL,
    `id_trabajador` INTEGER NOT NULL,
    `dia_semana` VARCHAR(10) NOT NULL,
    `trabaja` BOOLEAN NOT NULL,
    `hora_inicio` DATETIME(3) NOT NULL,
    `hora_fin` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_horario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `institucion_solicitud` (
    `id_institucion` INTEGER NOT NULL,
    `institucion` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id_institucion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `paciente` (
    `id_paciente` INTEGER NOT NULL,
    `fecha_ingreso` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_paciente`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `servicio_contratado` (
    `id_registro` INTEGER NOT NULL,
    `id_paciente` INTEGER NOT NULL,
    `id_trabajador` INTEGER NOT NULL,
    `duracion` INTEGER NOT NULL,
    `costo_total` VARCHAR(10) NOT NULL,
    `fecha_inicio_servicio` DATETIME(3) NOT NULL,
    `fecha_final_servicio` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_registro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `solicitud` (
    `id_solicitud` INTEGER NOT NULL,
    `id_solicitante` INTEGER NOT NULL,
    `id_tipo_trabajador_solicitado` INTEGER NOT NULL,
    `sueldo_ofrecido` VARCHAR(10) NOT NULL,
    `id_estado_solicitud` INTEGER NOT NULL,
    `duracion` INTEGER NOT NULL,
    `fecha_inicio_servicio` DATETIME(3) NOT NULL,
    `fecha_final_servicio` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id_solicitud`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `solicitud_empleo` (
    `id_solicitud_empleo` INTEGER NOT NULL,
    `id_puesto_solicitado` INTEGER NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `apellido_paterno` VARCHAR(100) NOT NULL,
    `apellido_materno` VARCHAR(100) NOT NULL,
    `correo_electronico` VARCHAR(300) NOT NULL,
    `telefono` VARCHAR(10) NOT NULL,
    `ine` VARCHAR(191) NOT NULL,
    `curp` VARCHAR(191) NOT NULL,
    `acta_nacimiento` VARCHAR(191) NOT NULL,
    `fecha_nacimiento` DATETIME(3) NOT NULL,
    `direccion` VARCHAR(191) NOT NULL,
    `fotografia` VARCHAR(191) NOT NULL,
    `referencias_personales` VARCHAR(191) NULL,
    `experiencias_previas` VARCHAR(191) NULL,
    `ultimo_trabajo` VARCHAR(191) NULL,
    `salario_hora` VARCHAR(10) NOT NULL,

    UNIQUE INDEX `solicitud_empleo_id_solicitud_empleo_key`(`id_solicitud_empleo`),
    PRIMARY KEY (`id_solicitud_empleo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `titulo_solicitud` (
    `id_titulo` INTEGER NOT NULL,
    `titulo` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`id_titulo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trabajador` (
    `id_trabajador` INTEGER NOT NULL,
    `fecha_contratacion` DATETIME(3) NOT NULL,
    `correo_electronico` VARCHAR(300) NOT NULL,
    `salario_hora` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`id_trabajador`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tratamiento` (
    `id_paciente` INTEGER NOT NULL,
    `id_medicamento` INTEGER NOT NULL,
    `id_presentacion_medicamento` INTEGER NOT NULL,
    `id_unidad` INTEGER NOT NULL,
    `cantidad_suministrada` VARCHAR(10) NOT NULL,
    `inicio_tratamiento` DATETIME(3) NOT NULL,
    `duracion` INTEGER NOT NULL,
    `periodicidad` INTEGER NOT NULL,

    PRIMARY KEY (`id_paciente`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario` (
    `id_usuario` INTEGER NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `apellido_paterno` VARCHAR(100) NOT NULL,
    `apellido_materno` VARCHAR(100) NOT NULL,
    `telefono` VARCHAR(10) NOT NULL,
    `direccion` VARCHAR(100) NOT NULL,
    `fecha_nacimiento` DATETIME(3) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `id_tipo_usuario` INTEGER NOT NULL,
    `id_bandera` INTEGER NOT NULL,
    `id_genero` INTEGER NOT NULL,

    PRIMARY KEY (`id_usuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `datos_profesionales` ADD CONSTRAINT `datos_profesionales_id_trabajador_fkey` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador`(`id_trabajador`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `datos_profesionales` ADD CONSTRAINT `datos_profesionales_id_titulo_fkey` FOREIGN KEY (`id_titulo`) REFERENCES `catalogo_titulo`(`id_titulo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `datos_profesionales` ADD CONSTRAINT `datos_profesionales_id_institucion_fkey` FOREIGN KEY (`id_institucion`) REFERENCES `catalogo_institucion`(`id_institucion`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `datos_profesionales_solicitud` ADD CONSTRAINT `datos_profesionales_solicitud_id_solicitud_empleo_fkey` FOREIGN KEY (`id_solicitud_empleo`) REFERENCES `solicitud_empleo`(`id_solicitud_empleo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `datos_profesionales_solicitud` ADD CONSTRAINT `datos_profesionales_solicitud_id_institucion_fkey` FOREIGN KEY (`id_institucion`) REFERENCES `institucion_solicitud`(`id_institucion`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `datos_profesionales_solicitud` ADD CONSTRAINT `datos_profesionales_solicitud_id_titulo_fkey` FOREIGN KEY (`id_titulo`) REFERENCES `titulo_solicitud`(`id_titulo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `enfermedad_paciente` ADD CONSTRAINT `enfermedad_paciente_id_paciente_fkey` FOREIGN KEY (`id_paciente`) REFERENCES `paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `enfermedad_paciente` ADD CONSTRAINT `enfermedad_paciente_id_enfermedad_fkey` FOREIGN KEY (`id_enfermedad`) REFERENCES `catalogo_enfermedad`(`id_enfermedad`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `horario_solicitud_trabajador` ADD CONSTRAINT `horario_solicitud_trabajador_id_solicitud_empleo_fkey` FOREIGN KEY (`id_solicitud_empleo`) REFERENCES `solicitud_empleo`(`id_solicitud_empleo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `horario_trabajador` ADD CONSTRAINT `horario_trabajador_id_trabajador_fkey` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador`(`id_trabajador`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `paciente` ADD CONSTRAINT `paciente_id_paciente_fkey` FOREIGN KEY (`id_paciente`) REFERENCES `usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `servicio_contratado` ADD CONSTRAINT `servicio_contratado_id_paciente_fkey` FOREIGN KEY (`id_paciente`) REFERENCES `paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `servicio_contratado` ADD CONSTRAINT `servicio_contratado_id_trabajador_fkey` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador`(`id_trabajador`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `solicitud` ADD CONSTRAINT `solicitud_id_solicitante_fkey` FOREIGN KEY (`id_solicitante`) REFERENCES `paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `solicitud` ADD CONSTRAINT `solicitud_id_tipo_trabajador_solicitado_fkey` FOREIGN KEY (`id_tipo_trabajador_solicitado`) REFERENCES `catalogo_tipo_usuario`(`id_tipo_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `solicitud` ADD CONSTRAINT `solicitud_id_estado_solicitud_fkey` FOREIGN KEY (`id_estado_solicitud`) REFERENCES `catalogo_estado_solicitud`(`id_estado_solicitud`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `solicitud_empleo` ADD CONSTRAINT `solicitud_empleo_id_puesto_solicitado_fkey` FOREIGN KEY (`id_puesto_solicitado`) REFERENCES `catalogo_tipo_usuario`(`id_tipo_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `trabajador` ADD CONSTRAINT `trabajador_id_trabajador_fkey` FOREIGN KEY (`id_trabajador`) REFERENCES `usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tratamiento` ADD CONSTRAINT `tratamiento_id_paciente_fkey` FOREIGN KEY (`id_paciente`) REFERENCES `paciente`(`id_paciente`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tratamiento` ADD CONSTRAINT `tratamiento_id_medicamento_fkey` FOREIGN KEY (`id_medicamento`) REFERENCES `catalogo_medicamento`(`id_medicamento`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tratamiento` ADD CONSTRAINT `tratamiento_id_presentacion_medicamento_fkey` FOREIGN KEY (`id_presentacion_medicamento`) REFERENCES `catalogo_presentacion_medicamento`(`id_presentacion_medicamento`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tratamiento` ADD CONSTRAINT `tratamiento_id_unidad_fkey` FOREIGN KEY (`id_unidad`) REFERENCES `catalogo_unidad`(`id_unidad`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `usuario_id_tipo_usuario_fkey` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `catalogo_tipo_usuario`(`id_tipo_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `usuario_id_bandera_fkey` FOREIGN KEY (`id_bandera`) REFERENCES `catalogo_bandera`(`id_bandera`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `usuario_id_genero_fkey` FOREIGN KEY (`id_genero`) REFERENCES `catalogo_genero`(`id_genero`) ON DELETE RESTRICT ON UPDATE CASCADE;
