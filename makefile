RM := rm.exe
COMPILE_FLAGS = -c -O -ansi
LINKER_FLAGS = -O -ansi
HALUGEN_FLAGS = -cardtype MI-M4
MELCERTGEN_FLAGS = -cardtype MI-M4 -alist 7 -adf

# Outputs
OUTPUT_NAME = sample
OUTPUT_DIR = bin
OUTPUT_HZX = $(OUTPUT_DIR)/$(OUTPUT_NAME).hzx
OUTPUT_LST = $(OUTPUT_DIR)/$(OUTPUT_NAME).lst
OUTPUT_ALU = $(OUTPUT_DIR)/$(OUTPUT_NAME).alu
OUTPUT_CERTS = $(OUTPUT_DIR)/$(OUTPUT_NAME)
OUTPUT_ALC = $(OUTPUT_DIR)/$(OUTPUT_NAME).alc
OUTPUT_ADC = $(OUTPUT_DIR)/$(OUTPUT_NAME).adc

# Source Directories
C_SRCS_DIRS += \
src

# Source Files
C_SRCS += $(foreach dir,$(C_SRCS_DIRS),$(wildcard $(C_SRCS_DIRS)/*.c))

# Object Files
OBJS = $(foreach dir,$(C_SRCS_DIRS),$(addprefix $(OUTPUT_DIR)/,$(patsubst %.c,%.hzo,$(notdir $(wildcard $(C_SRCS_DIRS)/*.c)))))

all: sample

# Compile source code
$(OUTPUT_DIR)/%.hzo: src/%.c	
	@if not exist "$(OUTPUT_DIR)" mkdir "$(OUTPUT_DIR)"
	@echo 'Building file: $<'
	@echo 'Invoking: SmartDeck Compiler'
	hcl $(COMPILE_FLAGS) -o "$@" "$<"	
	@echo 'Finished building: $<'	

$(OUTPUT_NAME): $(OBJS)	
	@echo 'Invoking: SmartDeck Linker'
	hcl $(LINKER_FLAGS) -o "$(OUTPUT_HZX)" $(OBJS)	
	@hls "$(OUTPUT_HZX)" > $(OUTPUT_LST)	
	@halugen $(HALUGEN_FLAGS) -o $(OUTPUT_ALU) $(OUTPUT_HZX)
	@melcertgen $(OUTPUT_CERTS) $(MELCERTGEN_FLAGS) -hzx $(OUTPUT_HZX)		
	@echo 'Finished building: $(OUTPUT_ALU)'	

clean:
	$(RM) -rf $(OUTPUT_DIR)