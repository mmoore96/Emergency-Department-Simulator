//
//  Patient.swift
//  StarterGame
//
//  Created by Michael Moore on 11/9/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa

//The Patients use the Facade Pattern
class PatientManager {
    private var pt_01: Patient
    private var pt_02: Patient
    private var pt_03: Patient
    private var pt_04: Patient
    private var pt_05: Patient
    private var pt_06: Patient


    init() {
        self.pt_01 = pt_01_MainED()
        self.pt_02 = pt_02_MainED()
        self.pt_03 = pt_03_MainED()
        self.pt_04 = pt_04_MainED()
        self.pt_05 = pt_05_MainED()
        self.pt_06 = pt_06_MainED()
    }

    func speakPt_01(interaction: String, player: Player){
        pt_01.speak(interaction: interaction, player: player)
    }
    func speakPt_02(interaction: String, player: Player){
        pt_02.speak(interaction: interaction, player: player)
    }
    func speakPt_03(interaction: String, player: Player){
        pt_03.speak(interaction: interaction, player: player)
    }
    func speakPt_04(interaction: String, player: Player){
        pt_04.speak(interaction: interaction, player: player)
    }
    func speakPt_05(interaction: String, player: Player){
        pt_05.speak(interaction: interaction, player: player)
    }
    func speakPt_06(interaction: String, player: Player){
        pt_06.speak(interaction: interaction, player: player)
    }

}

protocol Patient {
    func speak(interaction: String, player: Player)
}
class pt_01_MainED: Patient {
    
    func hello(player: Player){
        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
        player.outputMessage("Ashely (Pt in ED Room 01)\n", color: customColors.pink!)
        player.outputMessage("A 30 year-old female was BIBA following a seizure. She was running a marathon in hot weather. Nearing the end, after 5 hours running, she was seen to fall to the ground and had a generalized tonic-clonic seizure. On arrival in the ED she was confused and agitated", color: NSColor.brown)
        
    }
    func speak(interaction: String, player: Player) {
        if interaction == "vitals"{
            self.vitalSigns(player: player)
            
            
        }
        else if interaction == "history"{
            self.physicalExam(player: player)
        }
        else if interaction == "PE"{
            self.physicalExam(player: player)
        }
        else if interaction == "labs"{
            self.labResults(player: player)
        }
        else if interaction == "imaging"{
            self.imagingResults(player: player)
        }
        else if interaction == "final"{
            self.finalDiagnosis(player: player)
        }
        else if interaction == "1"{
            self.CheckFinal(player: player)
        }
        else if interaction == "2"{
            self.Incorrect(player: player)
        }
        else if interaction == "3"{
            self.Incorrect(player: player)
        }
        else{
            hello(player: player)
        }
        }
    
    
    func vitalSigns(player: Player){
        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
        player.outputMessage("Ashely(Pt in ED Room 01)\n", color: customColors.pink!)
        player.outputMessage("Her oral temperature is 36.6 C, her chest is clear with SaO2 98% on air", color: NSColor.brown)
    }
    func history(player: Player){
        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
        player.outputMessage("Ashely(Pt in ED Room 01)\n", color: customColors.pink!)
        player.outputMessage("No PMHx, No PSHx, FMHx: Non-contributory, Social: Denies EtOH, denies drugs, denies smoking", color: NSColor.brown)
    }
    func physicalExam(player: Player){
        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
        player.outputMessage("Ashely(Pt in ED Room 01)", color: customColors.pink!)
        player.outputMessage("GEN: Confused, ENT: .5cm tongue lac noted, Lungs: CTAB, CARDIO: RRR, normal heart sounds, BLE: edematous ankles", color: NSColor.brown)
        }
    func labResults(player: Player){
        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
        player.outputMessage("Ashely(Pt in ED Room 01)\n", color: customColors.pink!)
        player.outputMessage("Sodium: 116\n Potassium: 4.7\n Urea: 10.5\n Creatinine: 128\n CK: 8,300\n Glucose: 4.1", color: NSColor.brown)
    }
    func imagingResults(player: Player){
        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
        player.outputMessage("Ashely(Pt in ED Room 01)\n", color: customColors.pink!)
        player.outputMessage("Brain CT: Normal Brain for Age", color: NSColor.brown)
    }
    func finalDiagnosis(player: Player){
        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
        player.outputMessage("Ashely(Pt in ED Room 01)", color: customColors.pink!)
        player.outputMessage("\n1. Exercise-associated hyponatremia (EAH) complicated by encephalopathy (confusion and seizure).",color: NSColor.brown)
        player.outputMessage("\n2. CVA",color: NSColor.brown)
        player.outputMessage("\n3. dementia", color: NSColor.brown)
        
    }
    func CheckFinal(player: Player){
     
        player.outputMessage("You are correct!",color: NSColor.brown)
        player.currentGame.worldRooms[5].unlockRoom()
        player.currentGame.worldRooms[6].unlockRoom()
        let expObs = PlayerProggresion()
        _ = playerProgress(Obs: expObs, player: player)
        let exp = 50
        player.outputMessage("\nYou has gained " + String(exp) + " exp", color: NSColor.lightGray)
        expObs.playerExp = exp
        player.outputMessage(String("\nProvider Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
        player.goToRoom(room: player.currentGame.worldRooms[2])
    }
    
    func Incorrect(player: Player){
        player.playerStats.playerHealth -= 10
        player.outputMessage(String("Provider Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
        player.outputMessage("\nYou are not correct :(",color: NSColor.brown)
        player.playerStats.playerHealth = player.playerStats.playerMaxHealth
        player.goToRoom(room: player.currentGame.worldRooms[6])
    }
}
    class pt_02_MainED: Patient {
        
        func hello(player: Player){
            player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
            player.outputMessage("John(Pt in ED Room 01)\n", color: customColors.blue!)
            player.outputMessage("A 35 year-old male is brought to the emergency department after collapsing in a shopping centre. Paramedics found him to be GCS 3 and shortly afterwards required CPR and 1mg Epi for profound bradycardia and no pulse. Spontaneous output returned and no further drugs have been required to support his circulation.", color: NSColor.brown)
            
        }
        func speak(interaction: String, player: Player) {
            if interaction == "vitals"{
                self.vitalSigns(player: player)
                
                
            }
            else if interaction == "history"{
                self.physicalExam(player: player)
            }
            else if interaction == "PE"{
                self.physicalExam(player: player)
            }
            else if interaction == "labs"{
                self.labResults(player: player)
            }
            else if interaction == "imaging"{
                self.imagingResults(player: player)
            }
            else if interaction == "final"{
                self.finalDiagnosis(player: player)
            }
            else if interaction == "1"{
                self.Incorrect(player: player)
            }
            else if interaction == "2"{
                self.Incorrect(player: player)
            }
            else if interaction == "3"{
                self.CheckFinal(player: player)
            }
            else{
                hello(player: player)
            }
        }
        
        
        func vitalSigns(player: Player){
            player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
            player.outputMessage("John(Pt in ED Room 02)\n", color: customColors.blue!)
            player.outputMessage("Her oral temperature is 36.6 C, her chest is clear with SaO2 98% on air", color: NSColor.brown)
        }
        func history(player: Player){
            player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
            player.outputMessage("John(Pt in ED Room 02)\n", color: customColors.blue!)
            player.outputMessage("No PMHx, No PSHx, FMHx: Non-contributory, Social: Denies EtOH, denies drugs, denies smoking", color: NSColor.brown)
        }
        func physicalExam(player: Player){
            player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
            player.outputMessage("John(Pt in ED Room 02)", color: customColors.blue!)
            player.outputMessage("GEN: Unresponsive, Lungs: CTAB while on vent, CARDIO: Tachycardic but regular, normal heart sounds, Abd: Soft and non-distented, Neuro: Unresponsive, GCS: 3T", color: NSColor.brown)
        }
        func labResults(player: Player){
            player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
            player.outputMessage("John(Pt in ED Room 02)\n", color: customColors.blue!)
            player.outputMessage("D-dimer: 1.0", color: NSColor.brown)
        }
        func imagingResults(player: Player){
            player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
            player.outputMessage("John(Pt in ED Room 02)\n", color: customColors.blue!)
            player.outputMessage("Bedside echo: Small LV cavity size with normal LV systolic function\nSeptal flattening consistent with RV pressure overload\nSeverely dilated RV with severely reduced systolic function.", color: NSColor.brown)
        }
        func finalDiagnosis(player: Player){
            player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
            player.outputMessage("John(Pt in ED Room 02)\n", color: customColors.blue!)
            player.outputMessage("\n1. Complete heart block.",color: NSColor.brown)
            player.outputMessage("\n2. NSTEMI",color: NSColor.brown)
            player.outputMessage("\n3. massive pulmonary embolism ", color: NSColor.brown)
            
        }
        func CheckFinal(player: Player){
            
            player.outputMessage("You are correct!",color: NSColor.brown)
            player.currentGame.worldRooms[7].unlockRoom()
            player.currentGame.worldRooms[8].unlockRoom()
            let expObs = PlayerProggresion()
            _ = playerProgress(Obs: expObs, player: player)
            let exp = 50
            player.outputMessage("\nYou has gained " + String(exp) + " exp", color: NSColor.lightGray)
            expObs.playerExp = exp
            player.outputMessage(String("Provider ~ Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
            player.goToRoom(room: player.currentGame.worldRooms[2])
        }
        func Incorrect(player: Player){
            player.playerStats.playerHealth -= 50
            player.outputMessage(String("Provider ~ Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
            player.outputMessage("\nYou are not correct :(",color: NSColor.brown)
            player.playerStats.playerHealth = player.playerStats.playerMaxHealth
            player.goToRoom(room: player.currentGame.worldRooms[6])
        }
        
}
        class pt_03_MainED: Patient {
            
            func hello(player: Player){
                player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                player.outputMessage("Pat (Pt in ED Room 03)\n", color: customColors.pink!)
                player.outputMessage("23 year-old female with a 2 day history of a sore throat. She's had difficulty swallowing and finds it painful to eat and drink. Pt denies any N/V/D/CP/SOB/HA/syncope. No further symptomatology at this time", color: NSColor.brown)
                
            }
            func speak(interaction: String, player: Player) {
                if interaction == "vitals"{
                    self.vitalSigns(player: player)
                    
                    
                }
                else if interaction == "PE"{
                    self.physicalExam(player: player)
                }
                else if interaction == "labs"{
                    self.labResults(player: player)
                }
                else if interaction == "imaging"{
                    self.imagingResults(player: player)
                }
                else if interaction == "final"{
                    self.finalDiagnosis(player: player)
                }
                else if interaction == "2"{
                    self.CheckFinal(player: player)
                }
                else if interaction == "1"{
                    self.Incorrect(player: player)
                }
                else if interaction == "3"{
                    self.Incorrect(player: player)
                }
                else{
                    hello(player: player)
                }
            }
            
            
            func vitalSigns(player: Player){
                player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                player.outputMessage("Pat (Pt in ED Room 03)\n", color: customColors.pink!)
                player.outputMessage("Heart rate of 105BPM and a temperature of 38.2C.", color: NSColor.brown)
            }
            func history(player: Player){
                player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                player.outputMessage("Pat (Pt in ED Room 03)\n", color: customColors.pink!)
                player.outputMessage("No PMHx, No PSHx, FMHx: Non-contributory, Social: Denies EtOH, denies drugs, denies smoking", color: NSColor.brown)
            }
            func physicalExam(player: Player){
                player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                player.outputMessage("Pat (Pt in ED Room 03)", color: customColors.pink!)
                player.outputMessage("GEN: A&Ox3, ENT: Pharynx is diffusely erythematous with tonsillar exudate noted, no signs of PTA. Neck: Anterior cervical adenopathy noted. Lungs: CTAB, CARDIO: RRR, normal heart sounds.", color: NSColor.brown)
            }
            func labResults(player: Player){
                player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                player.outputMessage("Pat (Pt in ED Room 03)\n", color: customColors.pink!)
                player.outputMessage("group A beta-hemolytic streptococcal: Positive", color: NSColor.brown)
            }
            func imagingResults(player: Player){
                player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                player.outputMessage("Pat (Pt in ED Room 03)\n", color: customColors.pink!)
                player.outputMessage("None Ordered", color: NSColor.brown)
            }
            func finalDiagnosis(player: Player){
                player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                player.outputMessage("Pat (Pt in ED Room 03)\n", color: customColors.pink!)
                player.outputMessage("\n1. Viral Pharyngitis",color: NSColor.brown)
                player.outputMessage("\n2. Strep Pharyngitis with tonsillitis",color: NSColor.brown)
                player.outputMessage("\n3. URI", color: NSColor.brown)
                
            }
            func CheckFinal(player: Player){
                player.outputMessage("You are correct!",color: NSColor.brown)
                player.currentGame.worldRooms[9].unlockRoom()
                player.currentGame.worldRooms[10].unlockRoom()
                let expObs = PlayerProggresion()
                _ = playerProgress(Obs: expObs, player: player)
                let exp = 65
                player.outputMessage("\nYou has gained " + String(exp) + " exp", color: NSColor.lightGray)
                expObs.playerExp = exp
                player.outputMessage(String("Provider ~ Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
                player.goToRoom(room: player.currentGame.worldRooms[2])
            }
            
            func Incorrect(player: Player){
                player.playerStats.playerHealth -= 50
                player.outputMessage(String("Provider ~ Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
                player.outputMessage("You are not correct :(",color: NSColor.brown)
                player.playerStats.playerHealth = player.playerStats.playerMaxHealth
                player.goToRoom(room: player.currentGame.worldRooms[6])
            }
}
            
            class pt_04_MainED: Patient {
                
                func hello(player: Player){
                    player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                    player.outputMessage("Brett(Pt in ED Room 04)\n", color: customColors.blue!)
                    player.outputMessage("Previously healthy 11-year-old boy, presented to the ED after a witnessed syncopal event lasting 1 minute. The patient was walking with his family when he felt dizzy and collapsed. He had had a 2-day history of fever, cough, sore throat, and abdominal pain. He had not been experiencing chest pain, shortness of breath, vomiting, or diarrhea. The patient was not vaccinated against influenza and had had recent exposure to people with upper respiratory tract infections.", color: NSColor.brown)
                    
                }
                func speak(interaction: String, player: Player) {
                    if interaction == "vitals"{
                        self.vitalSigns(player: player)
                        
                        
                    }
                    else if interaction == "PE"{
                        self.physicalExam(player: player)
                    }
                    else if interaction == "labs"{
                        self.labResults(player: player)
                    }
                    else if interaction == "imaging"{
                        self.imagingResults(player: player)
                    }
                    else if interaction == "final"{
                        self.finalDiagnosis(player: player)
                    }
                    else if interaction == "1"{
                        self.CheckFinal(player: player)
                    }
                    else if interaction == "2"{
                        self.Incorrect(player: player)
                    }
                    else if interaction == "3"{
                        self.Incorrect(player: player)
                    }
                    else{
                        hello(player: player)
                    }
                }
                
                
                func vitalSigns(player: Player){
                    player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                    player.outputMessage("Brett(Pt in ED Room 04)\n", color: customColors.blue!)
                    player.outputMessage("Vital signs were as follows: temperature (T), 37.5 °C (99.5 °F) orally; heart rate (HR). 94 beats/min; respiratory rate (RR), 20 breaths/min; blood pressure (BP), 115/73 mm Hg with no orthostatic changes; and oxygen saturation, 100% on room air. His fever had resolved before the ED evaluation.", color: NSColor.brown)
                }
                func history(player: Player){
                    player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                    player.outputMessage("Brett(Pt in ED Room 04)\n", color: customColors.blue!)
                    player.outputMessage("No PMHx, No PSHx, FMHx: Non-contributory, Social: Denies EtOH, denies drugs, denies smoking", color: NSColor.brown)
                }
                func physicalExam(player: Player){
                    player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                    player.outputMessage("Smith, Ashely(Pt in ED Room 01)", color: customColors.blue!)
                    player.outputMessage("Physical examination showed a normotensive/normocardic adolescent male, appearing comfortable, without cardiac abnormality or neurologic deficits. The physical examination was normal except for an erythematous pharynx without tonsilomegaly or exudate.", color: NSColor.brown)
                }
                func labResults(player: Player){
                    player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                    player.outputMessage("Brett(Pt in ED Room 04)\n", color: customColors.blue!)
                    player.outputMessage("The ED evaluation included ECG, which showed a normal sinus rhythm without acute changes and a negative rapid strep test. A rapid influenza test was positive for influenza A that was subsequently confirmed to be H1N1. ", color: NSColor.brown)
                }
                func imagingResults(player: Player){
                    player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                    player.outputMessage("Brett(Pt in ED Room 04)\n", color: customColors.blue!)
                    player.outputMessage("Chest radiography was not done", color: NSColor.brown)
                }
                func finalDiagnosis(player: Player){
                    player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                    player.outputMessage("Brett(Pt in ED Room 04)\n", color: customColors.blue!)
                    player.outputMessage("1. Influenza",color: NSColor.brown)
                    player.outputMessage("2. URI",color: NSColor.brown)
                    player.outputMessage("3. WPW Syndrome", color: NSColor.brown)
                    
                }
                func CheckFinal(player: Player){
                    
                    player.outputMessage("You are correct!",color: NSColor.brown)
                    player.currentGame.worldRooms[11].unlockRoom()
                    player.currentGame.worldRooms[12].unlockRoom()
                    let expObs = PlayerProggresion()
                    _ = playerProgress(Obs: expObs, player: player)
                    let exp = 75
                    player.outputMessage("\nYou has gained " + String(exp) + " exp", color: NSColor.lightGray)
                    expObs.playerExp = exp
                    player.outputMessage(String("Provider ~ Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
                    player.goToRoom(room: player.currentGame.worldRooms[2])
                }
                
                func Incorrect(player: Player){
                    player.playerStats.playerHealth -= 50
                    player.outputMessage(String("Provider ~ Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
                    player.outputMessage("You are not correct :(",color: NSColor.brown)
                    player.playerStats.playerHealth = player.playerStats.playerMaxHealth
                    player.goToRoom(room: player.currentGame.worldRooms[6])
                }
}
                class pt_05_MainED: Patient {
                    
                    func hello(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Lauren (Pt in ED Room 05)\n", color: customColors.pink!)
                        player.outputMessage("The parents of a 16-day-old girl brought her to the emergency department from her pediatrician's office after development of a rash. The patient had a 2-day history of rash that began as a single vesicle above her right eyebrow and then spread over the remainder of her body. According to the parents, there has been no history of fever, irritability, vomiting, or lethargy. She continues to breastfeed and has good urine output. Parents report a history of liquid stools.", color: NSColor.brown)
                        
                    }
                    func speak(interaction: String, player: Player) {
                        if interaction == "vitals"{
                            self.vitalSigns(player: player)
                            
                            
                        }
                        else if interaction == "PE"{
                            self.physicalExam(player: player)
                        }
                        else if interaction == "labs"{
                            self.labResults(player: player)
                        }
                        else if interaction == "imaging"{
                            self.imagingResults(player: player)
                        }
                        else if interaction == "final"{
                            self.finalDiagnosis(player: player)
                        }
                        else if interaction == "2"{
                            self.CheckFinal(player: player)
                        }
                        else if interaction == "1"{
                            self.Incorrect(player: player)
                        }
                        else if interaction == "3"{
                            self.Incorrect(player: player)
                        }
                        else{
                            hello(player: player)
                        }
                    }
                    
                    
                    func vitalSigns(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Lauren (Pt in ED Room 05)\n", color: customColors.pink!)
                        player.outputMessage("The patient's initial vital signs were as follows: pulse, 120 beats/min: rectal temperature, 37.4°C; respiratory rate, 36 breaths/min; and weight, 3.6 kg.", color: NSColor.brown)
                    }
                    func history(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Lauren (Pt in ED Room 05)\n", color: customColors.pink!)
                        player.outputMessage("The infant was born at term via cesarean delivery. Prenatal laboratory tests were reported to be negative, and the mother says that she has no history of sexually transmitted infections.", color: NSColor.brown)
                    }
                    func physicalExam(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Lauren (Pt in ED Room 05)\n", color: customColors.pink!)
                        player.outputMessage("The patient was well developed, well nourished, non-irritable, and active. She had a flat anterior fontanel, with a clear oropharynx and no oral lesions. She had no lymphadenopathy. Her heart had a normal rhythm, with no murmur, gallop, or rub present, and her distal pulses were strong. Her lungs were clear bilaterally. She had a soft abdomen, with no masses, tenderness, or hepatosplenomegaly. Her umbilical stump was present. Her extremities had full range of motion, with no edema. Genitourinary examination revealed no labial rash or discharge. She was alert, with normal muscle tone. A vesicular rash with surrounding erythema was noted on the patient's face. The vesicles appeared in a linear arrangement located around her right eye, arm, and leg.", color: NSColor.brown)
                    }
                    func labResults(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Lauren (Pt in ED Room 05)\n", color: customColors.pink!)
                        player.outputMessage("A complete blood count, hepatic function panel, basic metabolic panel, and blood culture were obtained. The leukocyte count was 11.6 x109/L, with 28% neutrophils, 34% lymphocytes, 14% atypical lymphocytes, and 15% monocytes. The aspartate aminotransferase level (AST) was 34 U/L, and the alanine aminotransferase level (ALT) was 8 U/L. A lumbar puncture was difficult to perform, and therefore only enough spinal fluid was obtained for cultures. One of the vesicular lesions was scraped and sent for Tzanck smear. The patient was given 1 dose of intravenous acyclovir (20 mg/kg) in the emergency department and was admitted to the hospital.", color: NSColor.brown)
                    }
                    func imagingResults(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Lauren (Pt in ED Room 05)\n", color: customColors.pink!)
                        player.outputMessage("None were ordered", color: NSColor.brown)
                    }
                    func finalDiagnosis(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Lauren (Pt in ED Room 05)\n", color: customColors.pink!)
                        player.outputMessage("\n1. Impetigo",color: NSColor.brown)
                        player.outputMessage("\n2. Varicella",color: NSColor.brown)
                        player.outputMessage("\n3. Dyshidrotic Eczema", color: NSColor.brown)
                        
                    }
                    func CheckFinal(player: Player){
                        player.outputMessage("You are correct!",color: NSColor.brown)
                        player.currentGame.worldRooms[13].unlockRoom()
                        player.currentGame.worldRooms[14].unlockRoom()
                        let expObs = PlayerProggresion()
                        _ = playerProgress(Obs: expObs, player: player)
                        let exp = 100
                        player.outputMessage("\nYou has gained " + String(exp) + " exp", color: NSColor.lightGray)
                        expObs.playerExp = exp
                        player.outputMessage(String("Provider ~ Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
                        player.goToRoom(room: player.currentGame.worldRooms[2])
                    }
                    
                    func Incorrect(player: Player){
                        player.playerStats.playerHealth -= 50
                        player.outputMessage(String("Provider ~ Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
                        player.outputMessage("You are not correct :(",color: NSColor.brown)
                        player.playerStats.playerHealth = player.playerStats.playerMaxHealth
                        player.goToRoom(room: player.currentGame.worldRooms[6])
                    }
}
                class pt_06_MainED: Patient {
                    
                    func hello(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Michael (Pt in ED Room 01)\n", color: customColors.blue!)
                        player.outputMessage("A 21-month-old boy was traveling from West Virginia to visit his grandparents with his family when he had a change in mental status early in the morning, at around 8:30 a.m. He seemed to be somewhat lethargic and unresponsive. Because of the clear changes in sensorium, his parents rushed him to the hospital. They stated that he was pale and clammy, and was waxing and waning in mental status on his way to the emergency department (ED). They had arrived in town 2 days ago and noted that the child had some nasal congestion, which they attributed to the grandparents' dogs in the home. Because of the persistent congestion, they gave the patient 1 teaspoon of Benadryl the night before and three quarters of a teaspoon of Dimetapp® at about 5 a.m. on the morning of presentation. His parents reported no trauma, ingestion, or fever. The patient had a slight decrease in appetite but good urine output. He had no vomiting or diarrhea and no history of seizure activity at home.", color: NSColor.brown)
                        
                    }
                    func speak(interaction: String, player: Player) {
                        if interaction == "vitals"{
                            self.vitalSigns(player: player)
                            
                            
                        }
                        else if interaction == "PE"{
                            self.physicalExam(player: player)
                        }
                        else if interaction == "labs"{
                            self.labResults(player: player)
                        }
                        else if interaction == "imaging"{
                            self.imagingResults(player: player)
                        }
                        else if interaction == "final"{
                            self.finalDiagnosis(player: player)
                        }
                        else if interaction == "3"{
                            self.CheckFinal(player: player)
                        }
                        else if interaction == "2"{
                            self.Incorrect(player: player)
                        }
                        else if interaction == "1"{
                            self.Incorrect(player: player)
                        }
                        else{
                            hello(player: player)
                        }
                    }
                    
                    
                    func vitalSigns(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Michael (Pt in ED Room 06)\n", color: customColors.blue!)
                        player.outputMessage("Her oral temperature is 36.6 C, her chest is clear with SaO2 98% on air", color: NSColor.brown)
                    }
                    func history(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Michael (Pt in ED Room 06)\n", color: customColors.blue!)
                        player.outputMessage("The patient was born at 35 weeks gestation via cesarean delivery because of failure to progress. He had no other hospitalizations. He has up-to-date immunizations and no known drug allergies.", color: NSColor.brown)
                    }
                    func physicalExam(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Michael (Pt in ED Room 06)\n", color: customColors.blue!)
                        player.outputMessage("Vital signs: temperature, 95.6°F (rectal); heart rate, 116 beats per minute; respiratory rate, 24 breaths per minute; blood pressure, 83/47 mm Hg; room air oxygen saturation, 100%; weight, 11.2 kg General: carried to the room by nursing staff and placed on a stretcher; appears to look around but not focused; withdraws from pain; does not answer questions Head, eyes, ears, nose, and throat: normocephalic, atraumatic; pupils equal, round, reactive to light and accommodation; extraocular movements intact; no hemotympanum; no rhinorrhea; moist mucous membranes Neck: supple; negative for Kernig and Brudzinski signs Lungs: clear; no rales or wheezes Cardiovascular: regular rate and rhythm; no murmurs Abdomen: soft, nontender, no organomegaly or masses Genitourinary: circumcised male; testes descended Neurologic: localizes pain; no clonus; reflexes 2+ in upper and lower extremities; no Babinski reflex Skin: warm, dry, no rashes", color: NSColor.brown)
                    }
                    func labResults(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Michael (Pt in ED Room 06)\n", color: customColors.blue!)
                        player.outputMessage("pH, 7.2; PCO2, 41.5 mm Hg; PO2, 30.0 mm Hg; HCO3, 16.3 mEq/L; TCO2, 18 mEq/L; sodium, 135 mEq/L; potassium, 3.7 mEq/L; glucose, 47 mg/dL; base excess, -12; hematocrit, 39% \nCBC: WBC, 28.1 cells/μL/cubic mm; differential, 85% segmented neutrophils, 10% lymphocytes, 4% monocytes Urinalysis: specific gravity, 1.021; moderate ketones; negative glucose; negative reducing substrates Metabolic panel: sodium, 133 mEq/L; potassium, 3.6 mEq/L; chloride, 101 mEq/L; CO2 mEq/L, 19; glucose, 51 mg/dL; AST, 44 IU/L; ALT, 25 IU/L; albumin, 4.5 g/dL; anion gap, 13 mEq/L Lactate, 1.1 mg/dL Venous ammonia: 46 µmol/L Cortisol: 39.1 µg/dL Toxicology screen: negative (acetaminophen < 10 µg/mL, alcohol < 10 mg/dL, salicylates < 4 mg/dL)", color: NSColor.brown)
                    }
                    func imagingResults(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Michael (Pt in ED Room 06)\n", color: customColors.blue!)
                        player.outputMessage("CT of head: negative", color: NSColor.brown)
                    }
                    func finalDiagnosis(player: Player){
                        player.outputMessage("\nYou are evaluating: ", color: NSColor.white)
                        player.outputMessage("Michael (Pt in ED Room 06)\n", color: customColors.blue!)
                        player.outputMessage("\n1. DKA",color: NSColor.brown)
                        player.outputMessage("\n2. Septic shock in peds",color: NSColor.brown)
                        player.outputMessage("/n3. Hypoglycemia With Non-Anion Gap Acidosis", color: NSColor.brown)
                        
                    }
                    func CheckFinal(player: Player){
                        
                        player.outputMessage("You are correct!\nYou have finshed your shift in the ED and can now head home!",color: NSColor.brown)
                        player.currentGame.end()
                    }
                    
                    func Incorrect(player: Player){
                        player.playerStats.playerHealth -= 50
                        player.outputMessage(String("Provider ~ Health Grade: " + String(player.playerStats.playerHealth)), color: NSColor.gray)
                        player.outputMessage("You are not correct :(",color: NSColor.brown)
                        player.playerStats.playerHealth = player.playerStats.playerMaxHealth
                        player.goToRoom(room: player.currentGame.worldRooms[6])
                    }
}
