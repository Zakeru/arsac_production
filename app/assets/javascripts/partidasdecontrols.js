
    $(document).ready(function(){
        $("#itemsofcontrol_sector_id").change(function(event){
            var id = $("#itemsofcontrol_sector_id").find(':selected').val();
            $("#itemsofcontrol_subsector_id").load('/production/itemsofcontrols/mostrar/'+id);
        });
    });

    $(document).ready(function(){
        $("#itemsofcontrol_phase_id").change(function(event){
            var id = $("#itemsofcontrol_phase_id").find(':selected').val();
            $("#itemsofcontrol_subphase_id").load('/production/itemsofcontrols/valuesubfase/'+id);
        });
    });   
    


    /*  Parte Diario de obra Seccion Registros */
    $(document).ready(function(){ 
        $('#partdayliofperson_workers_attributes_0_normal, #partdayliofperson_workers_attributes_0_normal_60, #partdayliofperson_workers_attributes_0_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_0_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_0_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_0_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_0_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_1_normal, #partdayliofperson_workers_attributes_1_normal_60, #partdayliofperson_workers_attributes_1_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_1_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_1_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_1_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_1_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_2_normal, #partdayliofperson_workers_attributes_2_normal_60, #partdayliofperson_workers_attributes_2_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_2_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_2_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_2_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_2_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_3_normal, #partdayliofperson_workers_attributes_3_normal_60, #partdayliofperson_workers_attributes_3_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_3_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_3_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_3_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_3_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_4_normal, #partdayliofperson_workers_attributes_4_normal_60, #partdayliofperson_workers_attributes_4_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_4_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_4_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_4_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_4_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_5_normal, #partdayliofperson_workers_attributes_5_normal_60, #partdayliofperson_workers_attributes_5_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_5_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_5_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_5_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_5_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_6_normal, #partdayliofperson_workers_attributes_6_normal_60, #partdayliofperson_workers_attributes_6_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_6_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_6_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_6_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_6_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_7_normal, #partdayliofperson_workers_attributes_7_normal_60, #partdayliofperson_workers_attributes_7_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_7_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_7_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_7_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_7_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_8_normal, #partdayliofperson_workers_attributes_8_normal_60, #partdayliofperson_workers_attributes_8_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_8_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_8_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_8_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_8_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_9_normal, #partdayliofperson_workers_attributes_9_normal_60, #partdayliofperson_workers_attributes_9_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_9_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_9_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_9_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_9_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_10_normal, #partdayliofperson_workers_attributes_10_normal_60, #partdayliofperson_workers_attributes_10_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_10_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_10_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_10_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_10_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_11_normal, #partdayliofperson_workers_attributes_11_normal_60, #partdayliofperson_workers_attributes_11_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_11_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_11_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_11_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_11_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_12_normal, #partdayliofperson_workers_attributes_12_normal_60, #partdayliofperson_workers_attributes_12_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_12_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_12_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_12_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_12_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_13_normal, #partdayliofperson_workers_attributes_13_normal_60, #partdayliofperson_workers_attributes_13_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_13_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_13_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_13_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_13_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_14_normal, #partdayliofperson_workers_attributes_14_normal_60, #partdayliofperson_workers_attributes_14_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_14_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_14_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_14_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_14_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_15_normal, #partdayliofperson_workers_attributes_15_normal_60, #partdayliofperson_workers_attributes_15_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_15_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_15_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_15_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_15_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_16_normal, #partdayliofperson_workers_attributes_16_normal_60, #partdayliofperson_workers_attributes_16_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_16_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_16_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_16_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_16_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_17_normal, #partdayliofperson_workers_attributes_17_normal_60, #partdayliofperson_workers_attributes_17_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_17_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_17_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_17_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_17_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_18_normal, #partdayliofperson_workers_attributes_18_normal_60, #partdayliofperson_workers_attributes_18_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_18_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_18_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_18_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_18_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_19_normal, #partdayliofperson_workers_attributes_19_normal_60, #partdayliofperson_workers_attributes_19_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_19_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_19_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_19_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_19_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_20_normal, #partdayliofperson_workers_attributes_20_normal_60, #partdayliofperson_workers_attributes_20_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_20_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_20_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_20_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_20_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_21_normal, #partdayliofperson_workers_attributes_21_normal_60, #partdayliofperson_workers_attributes_21_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_21_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_21_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_21_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_21_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_22_normal, #partdayliofperson_workers_attributes_22_normal_60, #partdayliofperson_workers_attributes_22_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_22_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_22_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_22_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_22_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_23_normal, #partdayliofperson_workers_attributes_23_normal_60, #partdayliofperson_workers_attributes_23_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_23_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_23_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_23_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_23_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_24_normal, #partdayliofperson_workers_attributes_24_normal_60, #partdayliofperson_workers_attributes_24_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_24_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_24_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_24_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_24_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_25_normal, #partdayliofperson_workers_attributes_25_normal_60, #partdayliofperson_workers_attributes_25_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_25_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_25_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_25_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_25_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_26_normal, #partdayliofperson_workers_attributes_26_normal_60, #partdayliofperson_workers_attributes_26_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_26_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_26_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_26_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_26_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_27_normal, #partdayliofperson_workers_attributes_27_normal_60, #partdayliofperson_workers_attributes_27_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_27_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_27_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_27_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_27_total_horas').val(val);
        });
        $('#partdayliofperson_workers_attributes_28_normal, #partdayliofperson_workers_attributes_28_normal_60, #partdayliofperson_workers_attributes_28_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_28_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_28_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_28_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_28_total_horas').val(val);
        });

        $('#partdayliofperson_workers_attributes_29_normal, #partdayliofperson_workers_attributes_29_normal_60, #partdayliofperson_workers_attributes_29_normal_100').change(function(event){             
            var1 = parseFloat($('#partdayliofperson_workers_attributes_29_normal').val());
            var2 = parseFloat($('#partdayliofperson_workers_attributes_29_normal_60').val());
            var3 = parseFloat($('#partdayliofperson_workers_attributes_29_normal_100').val());
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if (isNaN(var3)) {
                var3 = 0;
            }
            val = var1 + var2 + var3 ;
            val = val.toFixed(2)
            $('#partdayliofperson_workers_attributes_29_total_horas').val(val);
        });
    });
    /*  End Parte Diario de obra Seccion Registros */

    

    $(document).ready(function(){ $("#partwork_items_attributes_0_list_id").change(function(event){ var id = $("#partwork_items_attributes_0_list_id").find(':selected').val(); $("#partwork_items_attributes_0_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_1_list_id").change(function(event){ var id = $("#partwork_items_attributes_1_list_id").find(':selected').val(); $("#partwork_items_attributes_1_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_2_list_id").change(function(event){ var id = $("#partwork_items_attributes_2_list_id").find(':selected').val(); $("#partwork_items_attributes_2_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_3_list_id").change(function(event){ var id = $("#partwork_items_attributes_3_list_id").find(':selected').val(); $("#partwork_items_attributes_3_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_4_list_id").change(function(event){ var id = $("#partwork_items_attributes_4_list_id").find(':selected').val(); $("#partwork_items_attributes_4_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_5_list_id").change(function(event){ var id = $("#partwork_items_attributes_5_list_id").find(':selected').val(); $("#partwork_items_attributes_5_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_6_list_id").change(function(event){ var id = $("#partwork_items_attributes_6_list_id").find(':selected').val(); $("#partwork_items_attributes_6_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_7_list_id").change(function(event){ var id = $("#partwork_items_attributes_7_list_id").find(':selected').val(); $("#partwork_items_attributes_7_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_8_list_id").change(function(event){ var id = $("#partwork_items_attributes_8_list_id").find(':selected').val(); $("#partwork_items_attributes_8_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_9_list_id").change(function(event){ var id = $("#partwork_items_attributes_9_list_id").find(':selected').val(); $("#partwork_items_attributes_9_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_10_list_id").change(function(event){ var id = $("#partwork_items_attributes_10_list_id").find(':selected').val(); $("#partwork_items_attributes_10_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });
    $(document).ready(function(){ $("#partwork_items_attributes_11_list_id").change(function(event){ var id = $("#partwork_items_attributes_11_list_id").find(':selected').val(); $("#partwork_items_attributes_11_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });    
    $(document).ready(function(){ $("#partwork_items_attributes_12_list_id").change(function(event){ var id = $("#partwork_items_attributes_12_list_id").find(':selected').val(); $("#partwork_items_attributes_12_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });    
    $(document).ready(function(){ $("#partwork_items_attributes_13_list_id").change(function(event){ var id = $("#partwork_items_attributes_13_list_id").find(':selected').val(); $("#partwork_items_attributes_13_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });    
    $(document).ready(function(){ $("#partwork_items_attributes_14_list_id").change(function(event){ var id = $("#partwork_items_attributes_14_list_id").find(':selected').val(); $("#partwork_items_attributes_14_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });    
    $(document).ready(function(){ $("#partwork_items_attributes_15_list_id").change(function(event){ var id = $("#partwork_items_attributes_15_list_id").find(':selected').val(); $("#partwork_items_attributes_15_unit_id").load('/production/partworks/values_partidaunidad/'+id); }); });      


    /*  parte de equipos */
    $(document).ready(function(){
        $("#partofequipment_subcontractofequipment_id").change(function(event){
            var id = $("#partofequipment_subcontractofequipment_id").find(':selected').val();
            $("#partofequipment_equipmentsofsubcontract_id").load('/production/partofequipments/values_equiposdesubcontrato/'+id);
        });
    });
    /*  End parte de equipos */

    /* partedeequipos unidades automaticas al seleccionar equipo */
        $(document).ready(function(){
        $("#partofequipment_equipmentsofsubcontract_id").change(function(event){
            var id = $("#partofequipment_equipmentsofsubcontract_id").find(':selected').val();                
            $("#partofequipment_equipmentregisters_attributes_0_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_1_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_2_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_3_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_4_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_5_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_6_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_7_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_8_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_9_unit_id").load('/production/partofequipments/values_unidades/'+id);
            $("#partofequipment_equipmentregisters_attributes_10_unit_id").load('/production/partofequipments/values_unidades/'+id);            
        });
    });        
    /* final */



    /* Subcontrato de Equipos suma de parciales */   
    /* ==========================================*/ 
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_0_cantidad, #subcontract_inputs_attributes_0_pu_sin_igv').change(function(event){
            var1 = parseFloat($('#subcontract_inputs_attributes_0_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_0_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_0_parcial').val(val);            
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_1_cantidad, #subcontract_inputs_attributes_1_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_1_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_1_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_1_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_2_cantidad, #subcontract_inputs_attributes_2_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_2_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_2_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_2_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_3_cantidad, #subcontract_inputs_attributes_3_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_3_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_3_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_3_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_4_cantidad, #subcontract_inputs_attributes_4_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_4_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_4_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_4_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_5_cantidad, #subcontract_inputs_attributes_5_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_5_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_5_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_5_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_6_cantidad, #subcontract_inputs_attributes_6_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_6_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_6_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_6_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_7_cantidad, #subcontract_inputs_attributes_7_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_7_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_7_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_7_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_8_cantidad, #subcontract_inputs_attributes_8_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_8_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_8_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_8_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_9_cantidad, #subcontract_inputs_attributes_9_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_9_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_9_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_9_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_10_cantidad, #subcontract_inputs_attributes_10_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_10_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_10_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_10_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_11_cantidad, #subcontract_inputs_attributes_11_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_11_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_11_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_11_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_12_cantidad, #subcontract_inputs_attributes_12_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_12_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_12_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_12_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_13_cantidad, #subcontract_inputs_attributes_13_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_13_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_13_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_13_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_14_cantidad, #subcontract_inputs_attributes_14_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_14_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_14_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_14_parcial').val(val);
        });
    });
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_15_cantidad, #subcontract_inputs_attributes_15_pu_sin_igv').change(function(event){             
            var1 = parseFloat($('#subcontract_inputs_attributes_15_cantidad').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_15_pu_sin_igv').val());            
            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }
            val = var1 * var2;
            val = val.toFixed(2)
            $('#subcontract_inputs_attributes_15_parcial').val(val);
        });
    });


    /* subcontracts  suma de monto contratado */
    /* ================================================== */
    $(document).ready(function(){ 
        $('#subcontract_inputs_attributes_0_pu_sin_igv, #subcontract_inputs_attributes_1_pu_sin_igv, #subcontract_inputs_attributes_2_pu_sin_igv, #subcontract_inputs_attributes_3_pu_sin_igv, #subcontract_inputs_attributes_4_pu_sin_igv, #subcontract_inputs_attributes_5_pu_sin_igv, #subcontract_inputs_attributes_6_pu_sin_igv, #subcontract_inputs_attributes_7_pu_sin_igv, #subcontract_inputs_attributes_8_pu_sin_igv, #subcontract_inputs_attributes_9_pu_sin_igv, #subcontract_inputs_attributes_10_pu_sin_igv, #subcontract_inputs_attributes_11_pu_sin_igv, #subcontract_inputs_attributes_12_pu_sin_igv, #subcontract_inputs_attributes_13_pu_sin_igv, #subcontract_inputs_attributes_14_pu_sin_igv, #subcontract_inputs_attributes_15_pu_sin_igv, #subcontract_inputs_attributes_16_pu_sin_igv').change(function(event){
            var1 = parseFloat($('#subcontract_inputs_attributes_0_parcial').val());
            var2 = parseFloat($('#subcontract_inputs_attributes_1_parcial').val());
            var3 = parseFloat($('#subcontract_inputs_attributes_2_parcial').val());                      
            var4 = parseFloat($('#subcontract_inputs_attributes_3_parcial').val());                      
            var5 = parseFloat($('#subcontract_inputs_attributes_4_parcial').val());     
            var6 = parseFloat($('#subcontract_inputs_attributes_5_parcial').val());                      
            var7 = parseFloat($('#subcontract_inputs_attributes_6_parcial').val());                      
            var8 = parseFloat($('#subcontract_inputs_attributes_7_parcial').val());                      
            var9 = parseFloat($('#subcontract_inputs_attributes_8_parcial').val());                      
            var10 = parseFloat($('#subcontract_inputs_attributes_9_parcial').val());                      
            var11 = parseFloat($('#subcontract_inputs_attributes_10_parcial').val());                      
            var12 = parseFloat($('#subcontract_inputs_attributes_11_parcial').val());                      
            var13 = parseFloat($('#subcontract_inputs_attributes_12_parcial').val());                      
            var14 = parseFloat($('#subcontract_inputs_attributes_13_parcial').val());                      
            var15 = parseFloat($('#subcontract_inputs_attributes_14_parcial').val());                      
            var16 = parseFloat($('#subcontract_inputs_attributes_15_parcial').val());                      

            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if(isNaN(var3)){
                var3 = 0;
            }if(isNaN(var4)){
                var4 = 0;
            }if(isNaN(var5)){
                var5 = 0;
            }if(isNaN(var6)){
                var6 = 0;
            }if(isNaN(var7)){
                var7 = 0;
            }if(isNaN(var8)){
                var8 = 0;
            }if(isNaN(var9)){
                var9 = 0;
            }if(isNaN(var10)){
                var10 = 0;
            }if(isNaN(var11)){
                var11 = 0;
            }if(isNaN(var12)){
                var12 = 0;
            }if(isNaN(var13)){
                var13 = 0;
            }if(isNaN(var14)){
                var14 = 0;
            }if(isNaN(var15)){
                var15 = 0;
            }if(isNaN(var16)){
                var16 = 0;
            }
            val = var1 + var2 + var3 + var4 +var5 + var6 + var7 + var8 + var9 + var10 + var11 + var12 + var13 + var14 + var15 + var16;
            val = val.toFixed(2);
            $('#subcontract_monto_contratado').val(val);
        });
    });
  
/* valorizaciones Subcontratistas */    
/* #####################################################################################################################*/
$(document).ready(function(){ 
    $('#actual_amortizacion_porcentaje').change(function(event){
        var1 = parseFloat($('#actual_amortizacion_porcentaje').val());
        var2 = parseFloat($('#actual_valorizacion_actual').val());            
        if (isNaN(var1)) {
            var1 = 0;    
        }if(isNaN(var2)){
            var2 = 0;
        }
        var3 = (var1/100)*var2 
        val =  var3     
        val = val.toFixed(2)
        $('#actual_amortizacion_numero').val(val);
    });
});

$(document).ready(function(){ 
    $('#actual_amortizacion_numero').change(function(event){
        var1 = parseFloat($('#actual_amortizacion_numero').val());
        var2 = parseFloat($('#actual_valorizacion_actual').val());            
        if (isNaN(var1)) {
            var1 = 0;    
        }if(isNaN(var2)){
            var2 = 0;
        }         
        val =  (var1/var2)*100
        
        val = val.toFixed(2)
        $('#actual_amortizacion_porcentaje').val(val);
    });
});

/* valorizaciones maquinarias */    
/* #####################################################################################################################*/
$(document).ready(function(){ 
    $('#f_amortizacion_inicial_porcentaje').change(function(event){
        var1 = parseFloat($('#f_amortizacion_inicial_porcentaje').val());
        var2 = parseFloat($('#actual_valorizacion_actual').val());            
        if (isNaN(var1)) {
            var1 = 0;    
        }if(isNaN(var2)){
            var2 = 0;
        }
        var3 = (var1/100)*var2 
        val =  var3     
        val = val.toFixed(2)
        $('#f_amortizacion_inicial_cantidad').val(val);
    });
});

$(document).ready(function(){ 
    $('#f_amortizacion_inicial_cantidad').change(function(event){
        var1 = parseFloat($('#f_amortizacion_inicial_cantidad').val());
        var2 = parseFloat($('#actual_valorizacion_actual').val());            
        if (isNaN(var1)) {
            var1 = 0;    
        }if(isNaN(var2)){
            var2 = 0;
        }         
        val =  (var1/var2)*100
        
        val = val.toFixed(2)
        $('#f_amortizacion_inicial_porcentaje').val(val);
    });
});


/*  parte de equipos inicio fin  */
$(document).ready(function(){ 
    $('#partofequipment_inicio, #partofequipment_fin, #partofequipment_diferencia').change(function(event){
        var1 = parseFloat($('#partofequipment_inicio').val());
        var2 = parseFloat($('#partofequipment_fin').val());            
        if (isNaN(var1)) {
            var1 = 0;    
        }if(isNaN(var2)){
            var2 = 0;
        }         
        val =  (var2 - var1)
        
        val = val.toFixed(2)
        $('#partofequipment_diferencia').val(val);
    });   
});

/*  parte diario de personal grupos de trabajo  */
$(document).ready(function(){
        $("#partdayliofperson_groupsofwork_id").change(function(event){
            var id = $("#partdayliofperson_groupsofwork_id").find(':selected').val();
            $("#partdayliofperson_workers_attributes_0_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_1_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_2_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_3_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_4_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_5_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_6_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_1_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_2_itemsofcontrol_id").load('/production/ppartdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_7_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_8_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_9_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_10_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_11_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_12_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_13_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_14_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_15_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_16_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_17_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_18_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_19_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_20_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_21_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_22_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_23_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_24_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_25_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_26_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_27_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_28_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_29_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);
            $("#partdayliofperson_workers_attributes_30_itemsofcontrol_id").load('/production/partdayliofpeople/values_partidasdecontrol/'+id);

        });
    });



/*  Primero  */
$(document).ready(function(){
        $("#combo1").change(function(event){
            var id = $("#combo1").find(':selected').val();
            $("#combo2").load('/production/reportofequipments/values_combo2/'+id);
        });
    });





/* partedeequipos  suma de HorasEfectivas */
    /* ================================================== */
    $(document).ready(function(){ 
        $('#partofequipment_equipmentregisters_attributes_0_cantidad, #partofequipment_equipmentregisters_attributes_1_cantidad, #partofequipment_equipmentregisters_attributes_2_cantidad, #partofequipment_equipmentregisters_attributes_3_cantidad, #partofequipment_equipmentregisters_attributes_4_cantidad, #partofequipment_equipmentregisters_attributes_5_cantidad, #partofequipment_equipmentregisters_attributes_6_cantidad, #partofequipment_equipmentregisters_attributes_7_cantidad, #partofequipment_equipmentregisters_attributes_8_cantidad, #partofequipment_equipmentregisters_attributes_9_cantidad, #partofequipment_equipmentregisters_attributes_10_cantidad').change(function(event){
            var1 = parseFloat($('#partofequipment_equipmentregisters_attributes_0_cantidad').val());
            var2 = parseFloat($('#partofequipment_equipmentregisters_attributes_1_cantidad').val());
            var3 = parseFloat($('#partofequipment_equipmentregisters_attributes_2_cantidad').val());                      
            var4 = parseFloat($('#partofequipment_equipmentregisters_attributes_3_cantidad').val());                      
            var5 = parseFloat($('#partofequipment_equipmentregisters_attributes_4_cantidad').val());     
            var6 = parseFloat($('#partofequipment_equipmentregisters_attributes_5_cantidad').val());                      
            var7 = parseFloat($('#partofequipment_equipmentregisters_attributes_6_cantidad').val());                      
            var8 = parseFloat($('#partofequipment_equipmentregisters_attributes_7_cantidad').val());                      
            var9 = parseFloat($('#partofequipment_equipmentregisters_attributes_8_cantidad').val());                      
            var10 = parseFloat($('#partofequipment_equipmentregisters_attributes_9_cantidad').val());                      
            var11 = parseFloat($('#partofequipment_equipmentregisters_attributes_10_cantidad').val());

            if (isNaN(var1)) {
                var1 = 0;    
            }if(isNaN(var2)){
                var2 = 0;
            }if(isNaN(var3)){
                var3 = 0;
            }if(isNaN(var4)){
                var4 = 0;
            }if(isNaN(var5)){
                var5 = 0;
            }if(isNaN(var6)){
                var6 = 0;
            }if(isNaN(var7)){
                var7 = 0;
            }if(isNaN(var8)){
                var8 = 0;
            }if(isNaN(var9)){
                var9 = 0;
            }if(isNaN(var10)){
                var10 = 0;
            }if(isNaN(var11)){
                var11 = 0;
            }
            
            val = var1 + var2 + var3 + var4 +var5 + var6 + var7 + var8 + var9 + var10 + var11;
            val = val.toFixed(2);
            $('#partedeequipo_total_horas_efectivas').val(val);
        });
    });



/*  Buscador de Parteobra  */
$(document).ready(function(){
    $("#parteobra_campo").change(function(event){
        var id = $("#parteobra_campo").find(':selected').val();
        $("#parteobra_opcion").load('/production/partworks/values_opcion/'+id);        
    });
});
/*  Buscador de Partedepersonals  */
$(document).ready(function(){
    $("#partediariodepersonal_campo").change(function(event){
        var id = $("#partediariodepersonal_campo").find(':selected').val();
        $("#partediariodepersonal_opcion").load('/production/partdayliofpeople/values_opcion/'+id);        
    });
});
/*  Buscador de Partedeequipo  */
$(document).ready(function(){
    $("#partedeequipo_campo").change(function(event){
        var id = $("#partedeequipo_campo").find(':selected').val();
        $("#partedeequipo_opcion").load('/production/partofequipments/values_opcion/'+id);        
    });
});