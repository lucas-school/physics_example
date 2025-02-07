GDPC                                                                                <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex .      �      &�y���ڞu;>��.p   res://Block.tscn`      {      ��2��Nw��bU�X*   res://BlockTileMap.tscn �      �      &�{t�����=̾���    res://Main.tscn p	            ���,�%]#h�1"" *   res://Mapgen.gd.remap   �8      !       b1�4g�Â'�M�Y*   res://Mapgen.gdc�      Y      �K��C��chbB���   res://Mapgen.tscn   �      �      ���LX�̛���D�    res://ParallaxBackground.tscn   �      "      Xn�g��`��W�<�z   res://PlayerDemo.gd.remap    9      %       f똦ǐ|����IE�   res://PlayerDemo.gdc�%      @      ���62H:�E;9�   res://PlayerDemo.tscn    *             m�י�W������   res://TEST_noisegen.tscn ,      %      �+��2Gݲ>a�y��   res://default_env.tres  P-      �       um�`�N��<*ỳ�8   res://icon.png  09      �      G1?��z�c��vN��   res://icon.png.import   �3      �      ��fe��6�B��^ U�   res://keyfile.pub   �6      @      �usr)�P��m��%Yt   res://project.binary F            ,0;V0Θ�������7            [gd_scene load_steps=3 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 32, 32 )

[node name="Static2DBlock" type="StaticBody2D"]

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 1 )
     [gd_scene load_steps=4 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]

[sub_resource type="ConvexPolygonShape2D" id=1]
points = PoolVector2Array( 64, 64, 0, 64, 0, 0, 64, 0 )

[sub_resource type="TileSet" id=2]
0/name = "icon.png 0"
0/texture = ExtResource( 1 )
0/tex_offset = Vector2( 0, 0 )
0/modulate = Color( 1, 1, 1, 1 )
0/region = Rect2( 0, 0, 64, 64 )
0/tile_mode = 0
0/occluder_offset = Vector2( 0, 0 )
0/navigation_offset = Vector2( 0, 0 )
0/shape_offset = Vector2( 0, 0 )
0/shape_transform = Transform2D( 1, 0, 0, 1, 0, 0 )
0/shape = SubResource( 1 )
0/shape_one_way = false
0/shape_one_way_margin = 1.0
0/shapes = [ {
"autotile_coord": Vector2( 0, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 1 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
} ]
0/z_index = 0

[node name="BlockTileMap" type="TileMap"]
tile_set = SubResource( 2 )
format = 1
        [gd_scene load_steps=4 format=2]

[ext_resource path="res://Mapgen.tscn" type="PackedScene" id=1]
[ext_resource path="res://PlayerDemo.tscn" type="PackedScene" id=2]
[ext_resource path="res://ParallaxBackground.tscn" type="PackedScene" id=3]

[node name="Main" type="Node2D"]

[node name="PlayerDemo" parent="." instance=ExtResource( 2 )]
position = Vector2( 1290, 655 )

[node name="Camera2D" type="Camera2D" parent="PlayerDemo"]
current = true
zoom = Vector2( 2, 2 )
smoothing_enabled = true
smoothing_speed = 4.0
drag_margin_left = 1.0
drag_margin_top = 1.0
drag_margin_right = 1.0
drag_margin_bottom = 1.0

[node name="ParallaxBackground" parent="." instance=ExtResource( 3 )]
visible = false

[node name="Mapgen" parent="." instance=ExtResource( 1 )]
tile_data = PoolIntArray(  )
               GDSC            �      ������ƶ   ����Ӷ��   ���������������Ӷ���   ����   ����޶��   �����¶�   �����϶�   ������Ŷ   �����Ҷ�   ����������Ӷ   ���������϶�   ����������Ҷ���   ζ��   ϶��   �������ڶ���                           R���Q�?      Values:      �?  �������?                                                    	   "   
   #      +      1      7      =      C      D      E      J      V      W      ]      c      p      {      |      }      ~            �      �      3Y;�  �  T�  PQYY;�  Y;�  YYY0�  PQV�  �%  PQ�  �  �  T�)  �&  PQ�  �  T�  �  �  �  T�  �  �  �  T�	  �  �  �  T�
  �  Y�  �  �?  P�  Q�  �?  P�  T�  P�  R�  QQ�  �  )�  �  V�  )�  �  V�  &�  T�  P�  R�  Q�  V�  T�  P�  R�  R�  Q�  YYYYYY`       [gd_scene load_steps=5 format=2]

[ext_resource path="res://Mapgen.gd" type="Script" id=1]
[ext_resource path="res://icon.png" type="Texture" id=2]

[sub_resource type="ConvexPolygonShape2D" id=1]
points = PoolVector2Array( 64, 64, 0, 64, 0, 0, 64, 0 )

[sub_resource type="TileSet" id=2]
0/name = "icon.png 0"
0/texture = ExtResource( 2 )
0/tex_offset = Vector2( 0, 0 )
0/modulate = Color( 1, 1, 1, 1 )
0/region = Rect2( 0, 0, 64, 64 )
0/tile_mode = 0
0/occluder_offset = Vector2( 0, 0 )
0/navigation_offset = Vector2( 0, 0 )
0/shape_offset = Vector2( 0, 0 )
0/shape_transform = Transform2D( 1, 0, 0, 1, 0, 0 )
0/shape = SubResource( 1 )
0/shape_one_way = false
0/shape_one_way_margin = 1.0
0/shapes = [ {
"autotile_coord": Vector2( 0, 0 ),
"one_way": false,
"one_way_margin": 1.0,
"shape": SubResource( 1 ),
"shape_transform": Transform2D( 1, 0, 0, 1, 0, 0 )
} ]
0/z_index = 0

[node name="Mapgen" type="TileMap"]
tile_set = SubResource( 2 )
format = 1
tile_data = PoolIntArray( -65535, 536870912, 0, 1, 536870912, 0, 65537, 536870912, 0 )
script = ExtResource( 1 )

[node name="Camera2D" type="Camera2D" parent="."]
position = Vector2( 392, 160 )
zoom = Vector2( 8, 8 )
           [gd_scene load_steps=3 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]

[sub_resource type="TileSet" id=1]
0/name = "icon.png 0"
0/texture = ExtResource( 1 )
0/tex_offset = Vector2( 0, 0 )
0/modulate = Color( 1, 1, 1, 1 )
0/region = Rect2( 0, 0, 64, 64 )
0/tile_mode = 0
0/occluder_offset = Vector2( 0, 0 )
0/navigation_offset = Vector2( 0, 0 )
0/shape_offset = Vector2( 0, 0 )
0/shape_transform = Transform2D( 1, 0, 0, 1, 0, 0 )
0/shape_one_way = false
0/shape_one_way_margin = 0.0
0/shapes = [  ]
0/z_index = 0

[node name="ParallaxBackground" type="ParallaxBackground"]
scroll_ignore_camera_zoom = true

[node name="ParallaxLayer" type="ParallaxLayer" parent="."]
motion_scale = Vector2( 0.5, 0.5 )
motion_mirroring = Vector2( 1024, 640 )

[node name="TileMap" type="TileMap" parent="ParallaxLayer"]
modulate = Color( 1, 1, 1, 0.415686 )
position = Vector2( 0, -32 )
tile_set = SubResource( 1 )
format = 1
tile_data = PoolIntArray( 0, 536870912, 0, 1, 536870912, 0, 2, 536870912, 0, 3, 536870912, 0, 4, 536870912, 0, 5, 536870912, 0, 6, 536870912, 0, 7, 536870912, 0, 8, 536870912, 0, 9, 536870912, 0, 10, 536870912, 0, 11, 536870912, 0, 12, 536870912, 0, 13, 536870912, 0, 14, 536870912, 0, 15, 536870912, 0, 65536, 536870912, 0, 65537, 536870912, 0, 65538, 536870912, 0, 65539, 536870912, 0, 65540, 536870912, 0, 65541, 536870912, 0, 65542, 536870912, 0, 65543, 536870912, 0, 65544, 536870912, 0, 65545, 536870912, 0, 65546, 536870912, 0, 65547, 536870912, 0, 65548, 536870912, 0, 65549, 536870912, 0, 65550, 536870912, 0, 65551, 536870912, 0, 131072, 536870912, 0, 131073, 536870912, 0, 131074, 536870912, 0, 131075, 536870912, 0, 131076, 536870912, 0, 131077, 536870912, 0, 131078, 536870912, 0, 131079, 536870912, 0, 131080, 536870912, 0, 131081, 536870912, 0, 131082, 536870912, 0, 131083, 536870912, 0, 131084, 536870912, 0, 131085, 536870912, 0, 131086, 536870912, 0, 131087, 536870912, 0, 196608, 536870912, 0, 196609, 536870912, 0, 196610, 536870912, 0, 196611, 536870912, 0, 196612, 536870912, 0, 196613, 536870912, 0, 196614, 536870912, 0, 196615, 536870912, 0, 196616, 536870912, 0, 196617, 536870912, 0, 196618, 536870912, 0, 196619, 536870912, 0, 196620, 536870912, 0, 196621, 536870912, 0, 196622, 536870912, 0, 196623, 536870912, 0, 262144, 536870912, 0, 262145, 536870912, 0, 262146, 536870912, 0, 262147, 536870912, 0, 262148, 536870912, 0, 262149, 536870912, 0, 262150, 536870912, 0, 262151, 536870912, 0, 262152, 536870912, 0, 262153, 536870912, 0, 262154, 536870912, 0, 262155, 536870912, 0, 262156, 536870912, 0, 262157, 536870912, 0, 262158, 536870912, 0, 262159, 536870912, 0, 327680, 536870912, 0, 327681, 536870912, 0, 327682, 536870912, 0, 327683, 536870912, 0, 327684, 536870912, 0, 327685, 536870912, 0, 327686, 536870912, 0, 327687, 536870912, 0, 327688, 536870912, 0, 327689, 536870912, 0, 327690, 536870912, 0, 327691, 536870912, 0, 327692, 536870912, 0, 327693, 536870912, 0, 327694, 536870912, 0, 327695, 536870912, 0, 393216, 536870912, 0, 393217, 536870912, 0, 393218, 536870912, 0, 393219, 536870912, 0, 393220, 536870912, 0, 393221, 536870912, 0, 393222, 536870912, 0, 393223, 536870912, 0, 393224, 536870912, 0, 393225, 536870912, 0, 393226, 536870912, 0, 393227, 536870912, 0, 393228, 536870912, 0, 393229, 536870912, 0, 393230, 536870912, 0, 393231, 536870912, 0, 458752, 536870912, 0, 458753, 536870912, 0, 458754, 536870912, 0, 458755, 536870912, 0, 458756, 536870912, 0, 458757, 536870912, 0, 458758, 536870912, 0, 458759, 536870912, 0, 458760, 536870912, 0, 458761, 536870912, 0, 458762, 536870912, 0, 458763, 536870912, 0, 458764, 536870912, 0, 458765, 536870912, 0, 458766, 536870912, 0, 458767, 536870912, 0, 524288, 536870912, 0, 524289, 536870912, 0, 524290, 536870912, 0, 524291, 536870912, 0, 524292, 536870912, 0, 524293, 536870912, 0, 524294, 536870912, 0, 524295, 536870912, 0, 524296, 536870912, 0, 524297, 536870912, 0, 524298, 536870912, 0, 524299, 536870912, 0, 524300, 536870912, 0, 524301, 536870912, 0, 524302, 536870912, 0, 524303, 536870912, 0, 589824, 536870912, 0, 589825, 536870912, 0, 589826, 536870912, 0, 589827, 536870912, 0, 589828, 536870912, 0, 589829, 536870912, 0, 589830, 536870912, 0, 589831, 536870912, 0, 589832, 536870912, 0, 589833, 536870912, 0, 589834, 536870912, 0, 589835, 536870912, 0, 589836, 536870912, 0, 589837, 536870912, 0, 589838, 536870912, 0, 589839, 536870912, 0 )
              GDSC         !   �      ������������τ�   �������϶���   ��������   ���������Ӷ�   ����Ҷ��   ��ն   ������������   ������϶   ���������Ҷ�   ���������������Ŷ���   ����׶��   ϶��   ����¶��   ����������������Ҷ��   ζ��   �������������Ӷ�   �涶   ����������Ķ   ���������������������Ҷ�   �����������¶���   ���Ӷ���   ,          �������?   �     �        ui_right      ui_left       ui_up                      
                                 	      
   #      )      *      +      2      :      ;      D      S      \      l      o      u      v      w      x      y      �      �      �      �      �       �   !   3YY;�  �  T�  Y;�  YY;�  Y:�  �  Y:�  �  YY;�  �  Y;�  �  YYY0�	  P�
  QV�  �  T�  �  �
  �  �  &�  T�  P�  QV�  �  T�  �4  P�  T�  �  R�  Q�  '�  T�  P�  QV�  �  T�  �3  P�  T�  �  R�  Q�  (V�  �  T�  �  �  �  �  �  �  �  �  P�  R�  T�  Q�  &�  PQ�  T�  P�  QV�  �  T�  �  �  �  �  �  PQT�  �  Y`[gd_scene load_steps=4 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]
[ext_resource path="res://PlayerDemo.gd" type="Script" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 32, 32 )

[node name="PlayerDemo" type="KinematicBody2D"]
script = ExtResource( 2 )
__meta__ = {
"_edit_group_": true
}

[node name="Sprite" type="Sprite" parent="."]
modulate = Color( 1, 1, 1, 0.94902 )
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
     [gd_scene load_steps=3 format=2]

[sub_resource type="OpenSimplexNoise" id=1]
seed = 3
period = 14.1
persistence = 0.0
lacunarity = 1.52

[sub_resource type="NoiseTexture" id=2]
width = 1024
height = 1024
noise = SubResource( 1 )

[node name="Sprite" type="Sprite"]
texture = SubResource( 2 )
           [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3n6LK2d/2eYfw3mRh88/MZJAK+GLtzqHyQ181FNHnSR0TkHwroK9bLm4aQ66VMbnMst1fmZFZ5JzCjXpiPRWS0F/dbiv+Me/a7nresV4RP+elfNaM5zae4lo/7v7S7la4Zqn9XQc/w7pVBg8vJ2417DG5DDXLI2MucpWfRa7SArDnOaK1wAkPIIKCNrxZcKSio25Ldq7/N9gefFWmfFdzTpRAaCkD38xmcFa5PyYNVrvrfOC6AHdfvGkpQQr4djpBQpYqGypHgqoPLQNbLPf1pSz1aub//Td7G2S+dvyWvHHX2dr2xSEnX9AKQP8bUK3EKDP9bRFrHIOtF9Px5io3BOj1zT+ujZc2U5YSOm0Ck3Jnz8Ij+E/wqHiA0CN27IX7/VeQYeR3z9pG1kqKJwlEDGAVDN4hwN0ybuzb7Tlo72rj0HkSRVCfH1WA91SdR4E6tV0vxy33FqO3IXgcYrMTzYvnfUCTgmLTCdhbK1fxQOe5/K3/Oq0LQ6pc2hnGIwk= your_email@example.com
[remap]

path="res://Mapgen.gdc"
               [remap]

path="res://PlayerDemo.gdc"
           �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG	      application/config/name         physics example    application/run/main_scene         res://Main.tscn    application/config/icon         res://icon.png     display/window/size/resizable          +   gui/common/drop_mouse_on_gui_input_disabled            physics/common/physics_fps      x   )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_clear_color        �?  �?  �?  �?)   rendering/environment/default_environment          res://default_env.tres                 