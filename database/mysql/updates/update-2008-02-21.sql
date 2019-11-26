INSERT INTO encounterForm VALUES ('BC-AR 2007','../form/formbcar2007.jsp?demographic_no=','formBCAR2007', '1');

CREATE TABLE formBCAR2007(
  ID int(10) NOT NULL  auto_increment,
  demographic_no int(10) NOT NULL default '0' ,
  provider_no int(10)  default NULL ,
  formCreated date  default NULL ,
  formEdited timestamp   ,
  c_lastVisited char(3)   ,
  c_hospital varchar(60),
  pg1_priCare varchar(60),
  pg1_famPhy varchar(60),
  pg1_moName varchar(60),
  pg1_dateOfBirth date,
  pg1_ageAtEDD varchar(2),
  pg1_maidenName varchar(60),
  pg1_ethOrig varchar(60),
  pg1_langPref varchar(60),
  pg1_partnerName varchar(60),
  pg1_partnerAge varchar(2),
  pg1_faEthOrig varchar(50),
  c_surname varchar(30),
  c_givenName varchar(30),
  c_address varchar(60),
  c_city varchar(60),
  c_province varchar(50),
  c_postal varchar(8),
  c_phone varchar(60),
	c_phoneAlt1 varchar(60),
	c_phoneAlt2 varchar(60),
  c_phn varchar(20),
  pg1_gravida varchar(4),
  pg1_term varchar(4),
  pg1_preterm varchar(4),
  pg1_abortion varchar(3),
  pg1_induced varchar(3),
  pg1_spontaneous varchar(3),
  pg1_living varchar(3),
  pg1_obHistDate1 varchar(10),
  pg1_birthOrAbort1 varchar(20),
  pg1_deliWeek1 varchar(8),
  pg1_laboHr1 varchar(8),
  pg1_deliType1 varchar(30),
  pg1_periComp1 varchar(80),
  pg1_obHistSex1 varchar(1),
  pg1_birthWeit1 varchar(8),
  pg1_birthWeitUnits1 varchar(3),
  pg1_presHealth1 varchar(8),
  pg1_obHistDate2 varchar(10),
  pg1_birthOrAbort2 varchar(20),
  pg1_deliWeek2 varchar(8),
  pg1_laboHr2 varchar(8),
  pg1_deliType2 varchar(30),
  pg1_periComp2 varchar(80),
  pg1_obHistSex2 varchar(1),
  pg1_birthWeit2 varchar(8),
  pg1_birthWeitUnits2 varchar(3),
  pg1_presHealth2 varchar(8),
  pg1_obHistDate3 varchar(10),
  pg1_birthOrAbort3 varchar(20),
  pg1_deliWeek3 varchar(8),
  pg1_laboHr3 varchar(8),
  pg1_deliType3 varchar(30),
  pg1_periComp3 varchar(80),
  pg1_obHistSex3 varchar(1),
  pg1_birthWeit3 varchar(8),
  pg1_birthWeitUnits3 varchar(3),
  pg1_presHealth3 varchar(8),
  pg1_obHistDate4 varchar(10),
  pg1_birthOrAbort4 varchar(20),
  pg1_deliWeek4 varchar(8),
  pg1_laboHr4 varchar(8),
  pg1_deliType4 varchar(30),
  pg1_periComp4 varchar(80),
  pg1_obHistSex4 varchar(1),
  pg1_birthWeit4 varchar(8),
  pg1_birthWeitUnits4 varchar(3),
  pg1_presHealth4 varchar(8),
  pg1_obHistDate5 varchar(10),
  pg1_birthOrAbort5 varchar(20),
  pg1_deliWeek5 varchar(8),
  pg1_laboHr5 varchar(8),
  pg1_deliType5 varchar(30),
  pg1_periComp5 varchar(80),
  pg1_obHistSex5 varchar(1),
  pg1_birthWeit5 varchar(8),
	pg1_birthWeitUnits5 varchar(3),
  pg1_presHealth5 varchar(8),
  pg1_lmp date,
  pg1_mensCycle varchar(8),
  pg1_eddByDate date,
  pg1_contrMethod varchar(15),
  pg1_stopDate varchar(10),
  pg1_eddByUs date,
  pg1_eddByUsPerf tinyint(1),
  pg1_eddByUsGestWks varchar(2),
	pg1_eddByUsGestDays varchar(2),
  pg1_allergyN tinyint(1),
  pg1_allergyY tinyint(1),
  pg1_allergy varchar(50),
  pg1_curMedic varchar(255),
  pg1_beliPract varchar(60),
	pg1_IVFpregnancy tinyint(1),
	pg1_IVFpregnancySpec varchar(30),
  pg1_bleeding tinyint(1),
  pg1_bleedingSpec varchar(30),
  pg1_nausea tinyint(1),
  pg1_nauseaSpec varchar(30),
  pg1_infect tinyint(1),
  pg1_infectSpec varchar(30),
  pg1_prePregOther tinyint(1),
  pg1_prePregOtherSpec varchar(30),
	pg1_IFVpregnancy tinyint(1),
	pg1_IFVpregnancySpec varchar(30),
  pg1_heartDise tinyint(1),
  pg1_heartDiseSpec varchar(30),
  pg1_hyperts tinyint(1),
  pg1_hypertsSpec varchar(30),
  pg1_diabete tinyint(1),
  pg1_diabeteSpec varchar(30),
  pg1_deprPsychiat tinyint(1),
  pg1_deprPsychiatSpec varchar(30),
  pg1_alcohDrug tinyint(1),
  pg1_alcohDrugSpec varchar(30),
  pg1_thromCoag tinyint(1),
  pg1_thromCoagSpec varchar(30),
  pg1_inherDisease tinyint(1),
  pg1_inherDiseaseSpec varchar(30),
  pg1_ethnic tinyint(1),
  pg1_ethnicSpec varchar(30),
  pg1_famHistOther tinyint(1),
  pg1_famHistOtherSpec varchar(30),
  pg1_operation tinyint(1),
  pg1_operationSpec varchar(255),
  pg1_cvOrResp tinyint(1),
  pg1_cvOrRespSpec varchar(255),
  pg1_anesthetic tinyint(1),
  pg1_anestheticSpec varchar(40),
	pg1_uterineCxProc tinyint(1),
	pg1_uterineCxProcSpec varchar(40),
  pg1_infectStd tinyint(1),
  pg1_infectStdSpec varchar(40),
  pg1_susChiPox tinyint(1),
  pg1_susChiPoxSpec varchar(40),
  pg1_thrCoag tinyint(1),
  pg1_thrCoagSpec varchar(40),
  pg1_hyper tinyint(1),
  pg1_hyperSpec varchar(40),
  pg1_piGi tinyint(1),
  pg1_piGiSpec varchar(40),
  pg1_piUrin tinyint(1),
  pg1_piUrinSpec varchar(40),
  pg1_dbEndoc tinyint(1),
  pg1_dbEndocSpec varchar(40),
  pg1_seizNeur tinyint(1),
  pg1_seizNeurSpec varchar(40),
  pg1_deprPsy tinyint(1),
  pg1_deprPsySpec varchar(255),
	pg1_hxAnxiety tinyint(1),
	pg1_hxDepr tinyint(1),
	pg1_hxBipolar tinyint(1),
	pg1_hxPPDepr tinyint(1),
	pg1_hxUnknown tinyint(1),
	pg1_hxOther tinyint(1),
  pg1_piOther tinyint(1),
  pg1_piOtherSpec varchar(40),
  pg1_nutrition tinyint(1),
  pg1_nutritionSpec varchar(40),
	pg1_nutritionRef tinyint(1),
	pg1_foliAcidRef tinyint(1),
	pg1_stpWrkDate tinyint(1),
	pg1_stpWrkDateSpec varchar(30),
	pg1_stpWrkDateRef tinyint(1),
  pg1_foliAcid tinyint(1),
  pg1_foliAcidSpec varchar(30),
  pg1_alco tinyint(1),
	pg1_alcoNever tinyint(1),
	pg1_alcoQuit tinyint(1),
	pg1_alcoQuitDate date,
	pg1_alcoBef varchar(5),
	pg1_alcoCurr varchar(5),
	pg1_alcoBingeNo tinyint(1),
	pg1_alcoBingeYes tinyint(1),
	pg1_tweak tinyint(1),
	pg1_tweakScore varchar(15),
  pg1_drug tinyint(1),
  pg1_drugSpec varchar(30),
	pg1_drugRef tinyint(1),
  pg1_subUse tinyint(1),
	pg1_subUseNo tinyint(1),
	pg1_subUseYes tinyint(1),
  pg1_subUseSpec varchar(35),
	pg1_heroin tinyint(1),
	pg1_cocaine tinyint(1),
	pg1_marijuana tinyint(1),
	pg1_methadone tinyint(1),
	pg1_solvents tinyint(1),
	pg1_subUseOther tinyint(1),
	pg1_prescription tinyint(1),
	pg1_subUseUnknown tinyint(1),
  pg1_ipv tinyint(1),
  pg1_ipvSpec varchar(40),
	pg1_ipvRef tinyint(1),
  pg1_smokeBef tinyint(1),
  pg1_smokeBefSpec varchar(5),
  pg1_smokeCur tinyint(1),
  pg1_smokeCurSpec varchar(5),
	pg1_smokeNever tinyint(1),
	pg1_smokeQuit tinyint(1),
	pg1_smokeQuitDate date,
  pg1_secSmoke tinyint(1),
	pg1_secSmokeNo tinyint(1),
	pg1_secSmokeYes tinyint(1),
  pg1_secSmokeSpec varchar(30),
  pg1_finaHouse tinyint(1),
  pg1_finaHouseSpec varchar(30),
	pg1_finaHouseRef tinyint(1),
  pg1_supSys tinyint(1),
  pg1_supSysSpec varchar(30),
	pg1_supSysRef tinyint(1),
  pg1_schYear varchar(3),
  pg1_work varchar(25),
  pg1_workHourDay varchar(5),
  pg1_ptWork varchar(40),
  pg1_examination date,
  pg1_bp varchar(12),
  pg1_headNeck varchar(40),
  pg1_muscSpine varchar(40),
  pg1_breaNipp varchar(40),
  pg1_variSkin varchar(40),
  pg1_heartLung varchar(40),
  pg1_pelvic varchar(40),
  pg1_abdomen varchar(40),
  pg1_swabsCerv varchar(40),
  pg1_disBestCh tinyint(1),
  pg1_disPreEdu tinyint(1),
  pg1_disSexu tinyint(1),
	pg1_disFdSafety tinyint(1),
	pg1_disMSS tinyint(1),
	pg1_disMatPat tinyint(1),
	pg1_disBeltUse tinyint(1),
  pg1_disBfY tinyint(1),
  pg1_disBfN tinyint(1),
	pg1_disBfM tinyint(1),
  pg1_disGenCouns tinyint(1),
  pg1_disHIV tinyint(1),
  pg1_summary text,
  pg1_signature varchar(40),
  ar2_riskNeonDeath tinyint(1),
  ar2_riskStillbirth tinyint(1),
  ar2_riskAbortion tinyint(1),
  ar2_riskHabitAbort tinyint(1),
  ar2_riskPriPretBirth20 tinyint(1),
  ar2_riskPriCesBirth tinyint(1),
  ar2_riskPriIUGR tinyint(1),
  ar2_riskPriMacr tinyint(1),
  ar2_riskRhImmuY tinyint(1),
  ar2_riskRhImmuN tinyint(1),
  ar2_riskMajCongAnom tinyint(1),
  ar2_riskPPHemo tinyint(1),
  ar2_riskConDiet tinyint(1),
  ar2_riskInsDepend tinyint(1),
  ar2_riskRetDoc tinyint(1),
  ar2_riskAsymt tinyint(1),
  ar2_riskSymt tinyint(1),
  ar2_risk14090 tinyint(1),
  ar2_riskHyperDrug tinyint(1),
  ar2_riskChroRenalDisease tinyint(1),
  ar2_riskUnder18 tinyint(1),
  ar2_riskOver35 tinyint(1),
	ar2_riskUnderweight tinyint(1),
  ar2_riskObesity tinyint(1),
  ar2_riskH152 tinyint(1),
  ar2_riskDepre tinyint(1),
  ar2_riskAlcoDrug tinyint(1),
  ar2_riskSmoking tinyint(1),
  ar2_riskOtherMedical tinyint(1),
	ar2_riskAbnSerum tinyint(1),
	ar2_riskAlcoDrugCur tinyint(1),
  ar2_riskDiagLarge tinyint(1),
  ar2_riskDiagSmall tinyint(1),
  ar2_riskPolyhyd tinyint(1),
  ar2_riskMulPreg tinyint(1),
  ar2_riskMalpres tinyint(1),
  ar2_riskMemRupt37 tinyint(1),
  ar2_riskBleeding tinyint(1),
	ar2_riskFetalMov tinyint(1),
	ar2_riskDepreCur tinyint(1),
  ar2_riskPregIndHypert tinyint(1),
  ar2_riskProte1 tinyint(1),
  ar2_riskGesDiabete tinyint(1),
  ar2_riskBloodAnti tinyint(1),
  ar2_riskAnemia tinyint(1),
  ar2_riskAdmPreterm tinyint(1),
  ar2_riskPreg42W tinyint(1),
  ar2_riskWtLoss tinyint(1),
	ar2_riskSmokingCur tinyint(1),
  ar2_riskHypDisorder tinyint(1),
	ar2_riskPlacAbruption tinyint(1),
  ar2_inBirthPlace varchar(60),
	ar2_inBirthPlaceAlt varchar(60),
  ar2_labBlood varchar(12),
  ar2_labRh varchar(12),
  ar2_labRubella varchar(12),
	ar2_labPPvac tinyint(1),
  ar2_labHBsAg varchar(12),
	ar2_labHBsAgN tinyint(1),
	ar2_labHBsAgY tinyint(1),
	ar2_labHBsAgDate date,
	ar2_labHBsAgContact tinyint(1),
	ar2_labHBsAgVac tinyint(1),
  ar2_labHem1st varchar(12),
  ar2_labHem3rd varchar(12),
	ar2_urineCS varchar(3),
  ar2_labRATDate1 date,
  ar2_labRATRes1 varchar(10),
  ar2_labRATDate2 date,
  ar2_labRATRes2 varchar(10),
  ar2_labRhIgG date,
  ar2_labRhIgG2 date,
  ar2_labSTS varchar(10),
  ar2_labHivTestN tinyint(1),
  ar2_labHivTestY tinyint(1),
  ar2_labHIV varchar(10),
  ar2_labOtherTest varchar(200),
	ar2_labOtherHepC varchar(3),
	ar2_labOtherTSH varchar(3),
	ar2_labOtherVar varchar(3),
	ar2_labScreen varchar(10),
	ar2_labScreenSpec varchar(255),
  ar2_labGWeek varchar(5),
  ar2_labDiabDate date,
  ar2_labDiabRes varchar(10),
	ar2_labGGTDate date,
	ar2_labGGTRes varchar(60),
	ar2_labGBSDate date,
	ar2_labGBScopy tinyint(1),
  ar2_labGBSTestN tinyint(1),
  ar2_labGBSTestY tinyint(1),
  ar2_labGBSRes varchar(10),
	ar2_labEdinScore varchar(5),
	ar2_labEdinDate date,
	ar2_labEdinN tinyint(1),
	ar2_labEdinY tinyint(1),
  ar2_proPreg varchar(50),
  ar2_proLabour varchar(50),
  ar2_proPostPartum varchar(50),
  ar2_proNewBorn varchar(50),
	ar2_proLife varchar(50),
  ar2_age varchar(5),
  ar2_1USoundDate date,
  ar2_gestAgeUs varchar(10),
	ar2_amnioCutOffY tinyint(1),
	ar2_amnioCutOffN tinyint(1),
  pg2_probComment varchar(255),
  pg2_investigation text,
	pg3_probComment varchar(255),
  pg3_investigation text,
  pg2_doula varchar(100),
  pg2_doulaNo varchar(30),
	pg3_doula varchar(100),
  pg3_doulaNo varchar(30),
	ar2_topCall tinyint(1),
	ar2_topPreterm tinyint(1),
	ar2_topHosp tinyint(1),
	ar2_topDoula tinyint(1),
	ar2_topSleep tinyint(1),
	ar2_topRisks tinyint(1),
	ar2_topMove tinyint(1),
	ar2_topPlan tinyint(1),
	ar2_topVBAC tinyint(1),
	ar2_topSeats tinyint(1),
	ar2_topFeed tinyint(1),
	ar2_topPain tinyint(1),
	ar2_topCSec tinyint(1),
  c_ppWt varchar(5),
  c_ppHt varchar(5),
  c_ppBMI varchar(5),
  c_EDD date,
  pg2_date1 date,
  pg2_wt1 varchar(5),
	pg2_bmi1 varchar(5),
  pg2_bp1 varchar(8),
  pg2_urine1 varchar(8),
  pg2_urineG1 varchar(8),
  pg2_gest1 varchar(8),
  pg2_ht1 varchar(8),
  pg2_fhrAct1 varchar(8),
	pg2_FM1 tinyint(1),
  pg2_pos1 varchar(8),
  pg2_comment1 varchar(80),
  pg2_retIn1 varchar(8),
  pg2_date2 date,
  pg2_wt2 varchar(5),
	pg2_bmi2 varchar(5),
  pg2_bp2 varchar(8),
  pg2_urine2 varchar(8),
  pg2_urineG2 varchar(8),
  pg2_gest2 varchar(8),
  pg2_ht2 varchar(8),
  pg2_fhrAct2 varchar(8),
	pg2_FM2 tinyint(1),
  pg2_pos2 varchar(8),
  pg2_comment2 varchar(80),
  pg2_retIn2 varchar(8),
  pg2_date3 date,
  pg2_wt3 varchar(5),
	pg2_bmi3 varchar(5),
  pg2_bp3 varchar(8),
  pg2_urine3 varchar(8),
  pg2_urineG3 varchar(8),
  pg2_gest3 varchar(8),
  pg2_ht3 varchar(8),
  pg2_fhrAct3 varchar(8),
	pg2_FM3 tinyint(1),
  pg2_pos3 varchar(8),
  pg2_comment3 varchar(80),
  pg2_retIn3 varchar(8),
  pg2_date4 date,
  pg2_wt4 varchar(5),
	pg2_bmi4 varchar(5),
  pg2_bp4 varchar(8),
  pg2_urine4 varchar(8),
  pg2_urineG4 varchar(8),
  pg2_gest4 varchar(8),
  pg2_ht4 varchar(8),
  pg2_fhrAct4 varchar(8),
	pg2_FM4 tinyint(1),
  pg2_pos4 varchar(8),
  pg2_SentHosp20 tinyint(1),
  pg2_toPatient20 tinyint(1),
  pg2_comment4 varchar(80),
  pg2_retIn4 varchar(8),
  pg2_date5 date,
  pg2_wt5 varchar(5),
	pg2_bmi5 varchar(5),
  pg2_bp5 varchar(8),
  pg2_urine5 varchar(8),
  pg2_urineG5 varchar(8),
  pg2_gest5 varchar(8),
  pg2_ht5 varchar(8),
  pg2_fhrAct5 varchar(8),
	pg2_FM5 tinyint(1),
  pg2_pos5 varchar(8),
  pg2_comment5 varchar(80),
  pg2_retIn5 varchar(8),
  pg2_date6 date,
  pg2_wt6 varchar(5),
	pg2_bmi6 varchar(5),
  pg2_bp6 varchar(8),
  pg2_urine6 varchar(8),
  pg2_urineG6 varchar(8),
  pg2_gest6 varchar(8),
  pg2_ht6 varchar(8),
  pg2_fhrAct6 varchar(8),
	pg2_FM6 tinyint(1),
  pg2_pos6 varchar(8),
  pg2_comment6 varchar(80),
  pg2_retIn6 varchar(8),
  pg2_date7 date,
  pg2_wt7 varchar(5),
	pg2_bmi7 varchar(5),
  pg2_bp7 varchar(8),
  pg2_urine7 varchar(8),
  pg2_urineG7 varchar(8),
  pg2_gest7 varchar(8),
  pg2_ht7 varchar(8),
  pg2_fhrAct7 varchar(8),
	pg2_FM7 tinyint(1),
  pg2_pos7 varchar(8),
  pg2_comment7 varchar(80),
  pg2_retIn7 varchar(8),
  pg2_date8 date,
  pg2_wt8 varchar(5),
	pg2_bmi8 varchar(5),
  pg2_bp8 varchar(8),
  pg2_urine8 varchar(8),
  pg2_urineG8 varchar(8),
  pg2_gest8 varchar(8),
  pg2_ht8 varchar(8),
  pg2_fhrAct8 varchar(8),
	pg2_FM8 tinyint(1),
  pg2_pos8 varchar(8),
  pg2_comment8 varchar(80),
  pg2_retIn8 varchar(8),
  pg2_date9 date,
  pg2_wt9 varchar(5),
	pg2_bmi9 varchar(5),
  pg2_bp9 varchar(8),
  pg2_urine9 varchar(8),
  pg2_urineG9 varchar(8),
  pg2_gest9 varchar(8),
  pg2_ht9 varchar(8),
  pg2_fhrAct9 varchar(8),
	pg2_FM9 tinyint(1),
  pg2_pos9 varchar(8),
  pg2_comment9 varchar(80),
  pg2_retIn9 varchar(8),
  pg2_date10 date,
  pg2_wt10 varchar(5),
	pg2_bmi10 varchar(5),
  pg2_bp10 varchar(8),
  pg2_urine10 varchar(8),
  pg2_urineG10 varchar(8),
  pg2_gest10 varchar(8),
  pg2_ht10 varchar(8),
  pg2_fhrAct10 varchar(8),
	pg2_FM10 tinyint(1),
  pg2_pos10 varchar(8),
  pg2_comment10 varchar(80),
  pg2_retIn10 varchar(8),
  pg2_date11 date,
  pg2_wt11 varchar(5),
	pg2_bmi11 varchar(5),
  pg2_bp11 varchar(8),
  pg2_urine11 varchar(8),
  pg2_urineG11 varchar(8),
  pg2_gest11 varchar(8),
  pg2_ht11 varchar(8),
  pg2_fhrAct11 varchar(8),
	pg2_FM11 tinyint(1),
  pg2_pos11 varchar(8),
  pg2_comment11 varchar(80),
  pg2_retIn11 varchar(8),
  pg2_date12 date,
  pg2_wt12 varchar(5),
	pg2_bmi12 varchar(5),
  pg2_bp12 varchar(8),
  pg2_urine12 varchar(8),
  pg2_urineG12 varchar(8),
  pg2_gest12 varchar(8),
  pg2_ht12 varchar(8),
  pg2_fhrAct12 varchar(8),
	pg2_FM12 tinyint(1),
  pg2_pos12 varchar(8),
  pg2_comment12 varchar(80),
  pg2_retIn12 varchar(8),
  pg2_date13 date,
  pg2_wt13 varchar(5),
	pg2_bmi13 varchar(5),
  pg2_bp13 varchar(8),
  pg2_urine13 varchar(8),
  pg2_urineG13 varchar(8),
  pg2_gest13 varchar(8),
  pg2_ht13 varchar(8),
  pg2_fhrAct13 varchar(8),
	pg2_FM13 tinyint(1),
  pg2_pos13 varchar(8),
  pg2_comment13 varchar(80),
  pg2_retIn13 varchar(8),
  pg2_date14 date,
  pg2_wt14 varchar(5),
	pg2_bmi14 varchar(5),
  pg2_bp14 varchar(8),
  pg2_urine14 varchar(8),
  pg2_urineG14 varchar(8),
  pg2_gest14 varchar(8),
  pg2_ht14 varchar(8),
  pg2_fhrAct14 varchar(8),
	pg2_FM14 tinyint(1),
  pg2_pos14 varchar(8),
  pg2_comment14 varchar(80),
  pg2_retIn14 varchar(8),
  pg2_date15 date,
  pg2_wt15 varchar(5),
	pg2_bmi15 varchar(5),
  pg2_bp15 varchar(8),
  pg2_urine15 varchar(8),
  pg2_urineG15 varchar(8),
  pg2_gest15 varchar(8),
  pg2_ht15 varchar(8),
  pg2_fhrAct15 varchar(8),
	pg2_FM15 tinyint(1),
  pg2_pos15 varchar(8),
  pg2_comment15 varchar(80),
  pg2_retIn15 varchar(8),
  pg2_date16 date,
  pg2_wt16 varchar(5),
	pg2_bmi16 varchar(5),
  pg2_bp16 varchar(8),
  pg2_urine16 varchar(8),
  pg2_urineG16 varchar(8),
  pg2_gest16 varchar(8),
  pg2_ht16 varchar(8),
  pg2_fhrAct16 varchar(8),
	pg2_FM16 tinyint(1),
  pg2_pos16 varchar(8),
  pg2_comment16 varchar(80),
  pg2_retIn16 varchar(8),
  pg2_signature varchar(60),
  pg3_date1 date,
  pg3_wt1 varchar(5),
	pg3_bmi1 varchar(5),
  pg3_bp1 varchar(8),
  pg3_urine1 varchar(8),
  pg3_urineG1 varchar(8),
  pg3_gest1 varchar(8),
  pg3_ht1 varchar(8),
  pg3_fhrAct1 varchar(8),
	pg3_FM1 tinyint(1),
  pg3_pos1 varchar(8),
  pg3_comment1 varchar(80),
  pg3_retIn1 varchar(8),
  pg3_date2 date,
  pg3_wt2 varchar(5),
	pg3_bmi2 varchar(5),
  pg3_bp2 varchar(8),
  pg3_urine2 varchar(8),
  pg3_urineG2 varchar(8),
  pg3_gest2 varchar(8),
  pg3_ht2 varchar(8),
  pg3_fhrAct2 varchar(8),
	pg3_FM2 tinyint(1),
  pg3_pos2 varchar(8),
  pg3_comment2 varchar(80),
  pg3_retIn2 varchar(8),
  pg3_date3 date,
  pg3_wt3 varchar(5),
	pg3_bmi3 varchar(5),
  pg3_bp3 varchar(8),
  pg3_urine3 varchar(8),
  pg3_urineG3 varchar(8),
  pg3_gest3 varchar(8),
  pg3_ht3 varchar(8),
  pg3_fhrAct3 varchar(8),
	pg3_FM3 tinyint(1),
  pg3_pos3 varchar(8),
  pg3_comment3 varchar(80),
  pg3_retIn3 varchar(8),
  pg3_date4 date,
  pg3_wt4 varchar(5),
	pg3_bmi4 varchar(5),
  pg3_bp4 varchar(8),
  pg3_urine4 varchar(8),
  pg3_urineG4 varchar(8),
  pg3_gest4 varchar(8),
  pg3_ht4 varchar(8),
  pg3_fhrAct4 varchar(8),
	pg3_FM4 tinyint(1),
  pg3_pos4 varchar(8),
  pg3_SentHosp20 tinyint(1),
  pg3_toPatient20 tinyint(1),
  pg3_comment4 varchar(80),
  pg3_retIn4 varchar(8),
  pg3_date5 date,
  pg3_wt5 varchar(5),
	pg3_bmi5 varchar(5),
  pg3_bp5 varchar(8),
  pg3_urine5 varchar(8),
  pg3_urineG5 varchar(8),
  pg3_gest5 varchar(8),
  pg3_ht5 varchar(8),
  pg3_fhrAct5 varchar(8),
	pg3_FM5 tinyint(1),
  pg3_pos5 varchar(8),
  pg3_comment5 varchar(80),
  pg3_retIn5 varchar(8),
  pg3_date6 date,
  pg3_wt6 varchar(5),
	pg3_bmi6 varchar(5),
  pg3_bp6 varchar(8),
  pg3_urine6 varchar(8),
  pg3_urineG6 varchar(8),
  pg3_gest6 varchar(8),
  pg3_ht6 varchar(8),
  pg3_fhrAct6 varchar(8),
	pg3_FM6 tinyint(1),
  pg3_pos6 varchar(8),
  pg3_comment6 varchar(80),
  pg3_retIn6 varchar(8),
  pg3_date7 date,
  pg3_wt7 varchar(5),
	pg3_bmi7 varchar(5),
  pg3_bp7 varchar(8),
  pg3_urine7 varchar(8),
  pg3_urineG7 varchar(8),
  pg3_gest7 varchar(8),
  pg3_ht7 varchar(8),
  pg3_fhrAct7 varchar(8),
	pg3_FM7 tinyint(1),
  pg3_pos7 varchar(8),
  pg3_comment7 varchar(80),
  pg3_retIn7 varchar(8),
  pg3_date8 date,
  pg3_wt8 varchar(5),
	pg3_bmi8 varchar(5),
  pg3_bp8 varchar(8),
  pg3_urine8 varchar(8),
  pg3_urineG8 varchar(8),
  pg3_gest8 varchar(8),
  pg3_ht8 varchar(8),
  pg3_fhrAct8 varchar(8),
	pg3_FM8 tinyint(1),
  pg3_pos8 varchar(8),
  pg3_comment8 varchar(80),
  pg3_retIn8 varchar(8),
  pg3_date9 date,
  pg3_wt9 varchar(5),
	pg3_bmi9 varchar(5),
  pg3_bp9 varchar(8),
  pg3_urine9 varchar(8),
  pg3_urineG9 varchar(8),
  pg3_gest9 varchar(8),
  pg3_ht9 varchar(8),
  pg3_fhrAct9 varchar(8),
	pg3_FM9 tinyint(1),
  pg3_pos9 varchar(8),
  pg3_comment9 varchar(80),
  pg3_retIn9 varchar(8),
  pg3_date10 date,
  pg3_wt10 varchar(5),
	pg3_bmi10 varchar(5),
  pg3_bp10 varchar(8),
  pg3_urine10 varchar(8),
  pg3_urineG10 varchar(8),
  pg3_gest10 varchar(8),
  pg3_ht10 varchar(8),
  pg3_fhrAct10 varchar(8),
	pg3_FM10 tinyint(1),
  pg3_pos10 varchar(8),
  pg3_comment10 varchar(80),
  pg3_retIn10 varchar(8),
  pg3_date11 date,
  pg3_wt11 varchar(5),
	pg3_bmi11 varchar(5),
  pg3_bp11 varchar(8),
  pg3_urine11 varchar(8),
  pg3_urineG11 varchar(8),
  pg3_gest11 varchar(8),
  pg3_ht11 varchar(8),
  pg3_fhrAct11 varchar(8),
	pg3_FM11 tinyint(1),
  pg3_pos11 varchar(8),
  pg3_comment11 varchar(80),
  pg3_retIn11 varchar(8),
  pg3_date12 date,
  pg3_wt12 varchar(5),
	pg3_bmi12 varchar(5),
  pg3_bp12 varchar(8),
  pg3_urine12 varchar(8),
  pg3_urineG12 varchar(8),
  pg3_gest12 varchar(8),
  pg3_ht12 varchar(8),
  pg3_fhrAct12 varchar(8),
	pg3_FM12 tinyint(1),
  pg3_pos12 varchar(8),
  pg3_comment12 varchar(80),
  pg3_retIn12 varchar(8),
  pg3_date13 date,
  pg3_wt13 varchar(5),
	pg3_bmi13 varchar(5),
  pg3_bp13 varchar(8),
  pg3_urine13 varchar(8),
  pg3_urineG13 varchar(8),
  pg3_gest13 varchar(8),
  pg3_ht13 varchar(8),
  pg3_fhrAct13 varchar(8),
	pg3_FM13 tinyint(1),
  pg3_pos13 varchar(8),
  pg3_comment13 varchar(80),
  pg3_retIn13 varchar(8),
  pg3_date14 date,
  pg3_wt14 varchar(5),
	pg3_bmi14 varchar(5),
  pg3_bp14 varchar(8),
  pg3_urine14 varchar(8),
  pg3_urineG14 varchar(8),
  pg3_gest14 varchar(8),
  pg3_ht14 varchar(8),
  pg3_fhrAct14 varchar(8),
	pg3_FM14 tinyint(1),
  pg3_pos14 varchar(8),
  pg3_comment14 varchar(80),
  pg3_retIn14 varchar(8),
  pg3_date15 date,
  pg3_wt15 varchar(5),
	pg3_bmi15 varchar(5),
  pg3_bp15 varchar(8),
  pg3_urine15 varchar(8),
  pg3_urineG15 varchar(8),
  pg3_gest15 varchar(8),
  pg3_ht15 varchar(8),
  pg3_fhrAct15 varchar(8),
	pg3_FM15 tinyint(1),
  pg3_pos15 varchar(8),
  pg3_comment15 varchar(80),
  pg3_retIn15 varchar(8),
  pg3_date16 date,
  pg3_wt16 varchar(5),
	pg3_bmi16 varchar(5),
  pg3_bp16 varchar(8),
  pg3_urine16 varchar(8),
  pg3_urineG16 varchar(8),
  pg3_gest16 varchar(8),
  pg3_ht16 varchar(8),
  pg3_fhrAct16 varchar(8),
	pg3_FM16 tinyint(1),
  pg3_pos16 varchar(8),
  pg3_comment16 varchar(80),
  pg3_retIn16 varchar(8),
  pg3_signature varchar(60),
  PRIMARY KEY (ID)
) TYPE=MyISAM;


